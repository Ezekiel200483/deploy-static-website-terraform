variable "cloudfront_id" {
  description = "The ID of the CloudFront distribution"
  type        = string
}

variable "s3_bucket_arn" {
  description = "The ARN of the S3 bucket"
  type        = string
}

variable "account_id" {
  description = "The AWS account ID"
  type        = string
}

variable "s3_bucket_id" {
  description = "The AWS bucket ID"
  type        = string
}