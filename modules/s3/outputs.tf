output "bucket_domain_name" {
  value = aws_s3_bucket.static_website.bucket_regional_domain_name
}

output "bucket_name" {
  value = aws_s3_bucket.static_website.bucket
}

output "s3_bucket_arn" {
  value = aws_s3_bucket.static_website.arn
}

output "s3_bucket_id" {
  value = aws_s3_bucket.static_website.id
}