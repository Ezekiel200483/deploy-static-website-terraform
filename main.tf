provider "aws" {
  region = var.region
}

module "certificate" {
  source                  = "./modules/certificate"
  domain_name             = var.domain_name
  validation_record_fqdns = module.route53.validation_record_fqdns
}

module "cloudfront" {
  source              = "./modules/cloudfront"
  bucket_domain_name  = module.s3.bucket_domain_name
  bucket_name         = module.s3.bucket_name
  domain_name         = var.domain_name
  acm_certificate_arn = module.certificate.acm_certificate_arn
}

module "permissions" {
  source        = "./modules/permissions"
  cloudfront_id = module.cloudfront.cloudfront_id
  s3_bucket_arn = module.s3.s3_bucket_arn
  s3_bucket_id  = module.s3.s3_bucket_id
  account_id    = data.aws_caller_identity.current.account_id
}

module "route53" {
  source                    = "./modules/route53"
  domain_name               = var.domain_name
  cloudfront_domain         = module.cloudfront.cloudfront_domain_name
  cloudfront_host           = module.cloudfront.cloudfront_hosted_zone
  domain_validation_options = module.certificate.domain_validation_options
}

module "s3" {
  source      = "./modules/s3"
  bucket_name = var.bucket_name
}


data "aws_caller_identity" "current" {}