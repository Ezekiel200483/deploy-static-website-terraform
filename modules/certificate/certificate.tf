provider "aws" {
  alias  = "us-east-1"
  region = "us-east-1"
}

resource "aws_acm_certificate" "acm_cert" {
  provider          = aws.us-east-1
  domain_name       = var.domain_name
  validation_method = "DNS"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_acm_certificate_validation" "acm_valid" {
  provider                = aws.us-east-1
  certificate_arn         = aws_acm_certificate.acm_cert.arn
  validation_record_fqdns = var.validation_record_fqdns
}


