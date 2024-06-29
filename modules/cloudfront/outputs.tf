output "cloudfront_id" {
  value = aws_cloudfront_distribution.static_cloudfront.id
}

output "cloudfront_domain_name" {
  value = aws_cloudfront_distribution.static_cloudfront.domain_name
}

output "cloudfront_hosted_zone" {
  value = aws_cloudfront_distribution.static_cloudfront.hosted_zone_id
}