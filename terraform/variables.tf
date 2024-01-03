variable "bucket_name" {
  description = "name of the bucket to create"
  type        = string
  default     = "veksh-cloudresume"
}

variable "bucket_tags" {
  description = "additional tags to assign to the bucket"
  type        = map(string)
  default = {
    Usage = "web-hosting"
  }
}

variable "website_names" {
  description = "dns aliases for the website, first is a main name"
  type        = list(string)
  default     = ["resume.veksh.in", "cloudresume.veksh.in"]
}

variable "website_domain" {
  description = "top-level managed domain of website aliases, for GoDaddy DNS mgmt"
  type        = string
  default     = "veksh.in"
}
