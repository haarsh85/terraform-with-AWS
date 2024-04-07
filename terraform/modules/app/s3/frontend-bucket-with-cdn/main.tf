resource "aws_s3_bucket" "frontend_bucket_with_cdn" {
    bucket = var.frontend_bucket_with_cdn_name

    tags = {
      Name = var.frontend_bucket_with_cdn_name
      Application = "frontend"
      ManagedBy = "terraform"
    }
}

resource "aws_s3_bucket_ownership_controls" "frontend_bucket_ownership" {
  bucket = aws_s3_bucket.frontend_bucket_with_cdn.id
  rule {
    object_ownership = "BucketOwnerEnforced"
  }
}

resource "aws_s3_bucket_public_access_block" "frontend_bucket_public_access" {
  bucket = aws_s3_bucket.frontend_bucket_with_cdn.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# resource "aws_s3_bucket_acl" "frontend_bucket_acl" {
#   depends_on = [
#     aws_s3_bucket_ownership_controls.frontend_bucket_ownership,
#     aws_s3_bucket_public_access_block.frontend_bucket_public_access,
#   ]

#   bucket = aws_s3_bucket.frontend_bucket.id
#   acl    = "public-read"
# }

resource "aws_s3_bucket_versioning" "frontend_bucket_versioning" {
  bucket = aws_s3_bucket.frontend_bucket_with_cdn.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_policy" "cloudfront_s3_policy" {
    bucket = aws_s3_bucket.frontend_bucket_with_cdn.id
    policy = var.cloudfront_s3_bucket_policy
}

