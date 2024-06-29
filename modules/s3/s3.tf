resource "aws_s3_bucket" "static_website" {
  bucket        = var.bucket_name
  force_destroy = true
}

resource "aws_s3_bucket_public_access_block" "block_access" {
  bucket = aws_s3_bucket.static_website.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}


resource "aws_s3_object" "webfiles" {
  bucket       = aws_s3_bucket.static_website.id
  for_each     = fileset("modules/s3/Ass2-Altschool", "**/*.*")
  key          = each.value
  source       = "modules/s3/Ass2-Altschool/${each.value}"
  content_type = each.value
}


