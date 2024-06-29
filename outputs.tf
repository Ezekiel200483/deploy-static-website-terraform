// outputs.tf

output "s3_bucket_arn" {
  value = module.s3.s3_bucket_arn
}

output "bucket_name" {
  value = module.s3.bucket_name
}

output "cloudfront_domain_name" {
  value = module.cloudfront.cloudfront_domain_name
}

output "certificate_arn" {
  value = module.certificate.acm_certificate_arn
}

output "route53_zone_id" {
  value = module.route53.zone_id
}

output "route53_name_servers" {
  value = module.route53.name_servers
}