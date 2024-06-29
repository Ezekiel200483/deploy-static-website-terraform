variable "domain_name" {
  description = "The domain name"
  type        = string
}

variable "cloudfront_domain" {
  description = "The domain name of the CloudFront distribution"
  type        = string
}

variable "cloudfront_host" {
  description = "The hosted zone of the CloudFront distribution"
  type        = string
}


variable "domain_validation_options" {
  description = "Domain validation options for the ACM certificate"
  type        = list(object({
    domain_name           = string
    resource_record_name  = string
    resource_record_type  = string
    resource_record_value = string
  }))
}