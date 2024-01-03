# to override on command line
# - terraform plan -var='some-list=["abc", "123"]' -var=...
# - terraform plan -var-file="testing.tfvars"  # and put HCL there
# - export TF_VAR_image_id=ami-abc123

variable "bucket_name" {
  description = "name of the bucket to create"
  type        = string
  default     = "veksh-gh-site"
}

variable "bucket_tags" {
  description = "additional tags to assign to the bucket"
  type        = map(string)
  default     = {}
}

variable "website_names" {
  description = "dns aliases for the website, first is a main name"
  type        = list(string)
  default     = ["gh-s3-site.veksh.in"]
}

variable "website_domain" {
  description = "top-level managed domain of website aliases, required for (godaddy) DNS mgmt"
  type        = string
  default     = "veksh.in"
}
