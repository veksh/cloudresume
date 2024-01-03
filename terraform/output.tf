# sensitive = true for passwords
output "bucket_id" {
  value       = aws_s3_bucket.main.id
  description = "Name of the created bucket"
}

output "bucket_arn" {
  value       = aws_s3_bucket.main.arn
  description = "ARN of the created bucket"
}

output "bucket_dns" {
  value       = aws_s3_bucket.main.bucket_domain_name
  description = "Public DNS name of the created bucket"
}

output "cloudfront_arn" {
  value       = aws_cloudfront_distribution.s3_distribution.arn
  description = "cloudfront ARN"
}

output "cloudfront_dns" {
  value       = aws_cloudfront_distribution.s3_distribution.domain_name
  description = "Public DNS name of cloudfront host"
}

output "site_names" {
  value       = var.website_names
  description = "website names"
}
