# terraform init [-backend-config=s3-site.s3.tfbackend]
# terraform fmt -diff -check
# terraform validate - plan [-var-file=s3-site.tfvars]- apply - show - state list/show - destroy

locals {
  env_name    = "thirder"
  proj_name   = "gh-s3-site"
  name_prefix = "veksh"
}

terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    godaddy-dns = {
      source = "veksh/godaddy-dns"
      version = "~> 0.2"
    }
  }

  # lets keep the defaults here and override in projects if required (like vars)
  backend "s3" {
    region         = "eu-west-2"
    dynamodb_table = "veksh-terraform-locks"
    bucket         = "veksh-terraform-state"
    key            = "seconder/gh-s3-site.tfstate"
  }
}

provider "aws" {
  region = "eu-west-2"
  # no way to remove them in resources, so keep only necessary
  default_tags {
    tags = {
      Environment = "${local.env_name}"
      Project     = "${local.proj_name}"
    }
  }
}

# cloudfront requires (custom) cert to be in "us-east-1" region
# no need for 2nd provider if using only default cert
provider "aws" {
  alias  = "us-east-1"
  region = "us-east-1"
  default_tags {
    tags = {
      Environment = "${local.env_name}"
      Project     = "${local.proj_name}"
    }
  }
}

# expects GODADDY_API_KEY and GODADDY_API_SECRET in environment
provider "godaddy-dns" {}

resource "aws_s3_bucket" "main" {
  bucket = var.bucket_name
  tags   = var.bucket_tags
}

resource "aws_acm_certificate" "nondefault_cert" {
  # us-east-1 is required by cloudfront
  provider = aws.us-east-1

  domain_name               = var.website_names[0]
  subject_alternative_names = var.website_names
  validation_method = "DNS"

  lifecycle {
    create_before_destroy = true
  }
}

# challenge
resource "godaddy-dns_record" "cert_challenge" {
  for_each = {
    for dvo in aws_acm_certificate.nondefault_cert.domain_validation_options :
      dvo.domain_name => {
        name  = trimsuffix(dvo.resource_record_name, join("", [".", var.website_domain, "."]))
        data = trimsuffix(dvo.resource_record_value, ".")
      }
  }

  # (top-level domain of) each.key would be better, same domain now
  domain = var.website_domain
  type = "CNAME"
  name = each.value.name
  data = each.value.data
}

# use aws_acm_certificate_validation.example.certificate_arn
resource "aws_acm_certificate_validation" "nondefault_cert_valid" {
  provider = aws.us-east-1
  certificate_arn         = aws_acm_certificate.nondefault_cert.arn
  validation_record_fqdns = [
    for dvo in aws_acm_certificate.nondefault_cert.domain_validation_options :
      dvo.resource_record_name]
}

# could be anything really
locals {
  s3_origin_name = "main_s3_origin"
}

resource "aws_cloudfront_origin_access_identity" "main_cf_oai" {
  comment = "identity to have access to s3 bucket"
}

resource "aws_cloudfront_distribution" "s3_distribution" {
  origin {
    origin_id   = local.s3_origin_name
    domain_name = aws_s3_bucket.main.bucket_regional_domain_name
    # origin_access_control_id = aws_cloudfront_origin_access_control.default.id
    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.main_cf_oai.cloudfront_access_identity_path
    }
  }

  enabled             = true
  comment             = "hosting static site"
  default_root_object = "index.html"

  # enable together with custom cert
  aliases = var.website_names

  # required
  default_cache_behavior {
    allowed_methods  = ["HEAD", "GET", "OPTIONS"]
    cached_methods   = ["HEAD", "GET", "OPTIONS"]
    target_origin_id = local.s3_origin_name

    # or aws_cloudfront_cache_policy
    forwarded_values {
      query_string = true
      cookies {
        forward = "all"
      }
    }
    viewer_protocol_policy = "allow-all" # or "redirect-to-https"
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
      locations        = []
    }
  }

  viewer_certificate {
    # this is ok for default name (self.domain_name) like "d2tctm0i6bj2i4.cloudfront.net"
    # cloudfront_default_certificate = true
    # but lets try to go non-default
    # acm_certificate_arn = aws_acm_certificate.nondefault_cert.arn
    # even better, rely on validation
    acm_certificate_arn = aws_acm_certificate_validation.nondefault_cert_valid.certificate_arn
    # required for custom cert (but not for default_certificate)
    ssl_support_method = "sni-only"
  }

  # logging_config {
  #   include_cookies = false
  #   bucket          = "mylogs.s3.amazonaws.com"
  #   prefix          = "myprefix"
  # }

  # tags = {
  #   Environment = "production"
  # }
}

data "aws_iam_policy_document" "main_s3_policy_doc" {
  statement {
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.main.arn}/*"]
    principals {
      type        = "AWS"
      identifiers = [aws_cloudfront_origin_access_identity.main_cf_oai.iam_arn]
    }
  }
}

resource "aws_s3_bucket_policy" "main_s3_policy" {
  bucket = aws_s3_bucket.main.id
  policy = data.aws_iam_policy_document.main_s3_policy_doc.json
}

resource "aws_s3_object" "site_index" {
  key          = "index.html"
  bucket       = aws_s3_bucket.main.id
  content      = file("${path.module}/../data/index.html")
  content_type = "text/html"
}

resource "godaddy-dns_record" "site_cnames" {
  domain = var.website_domain
  for_each = toset(var.website_names)
  name = trimsuffix(each.value, join("", [".", var.website_domain]))
  type = "CNAME"
  data = aws_cloudfront_distribution.s3_distribution.domain_name
}
