resource "aws_s3_bucket_policy" "static_website_policy" {
  bucket = var.s3_bucket_id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Service = "cloudfront.amazonaws.com"
        },
        Action   = "s3:GetObject",
        Resource = "${var.s3_bucket_arn}/*",
        Condition = {
          StringEquals = {
            "AWS:SourceArn" = "arn:aws:cloudfront::${var.account_id}:distribution/${var.cloudfront_id}"
          }
        }
      }
    ]
  })
}

data "aws_caller_identity" "current" {}