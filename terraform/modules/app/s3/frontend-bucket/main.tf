resource "aws_s3_bucket" "frontend_bucket" {
    bucket = var.frontend_bucket_name

    tags = {
      Name = var.frontend_bucket_name
      Application = "frontend"
      ManagedBy = "terraform"
    }
}

resource "aws_s3_bucket_ownership_controls" "frontend_bucket_ownership" {
  bucket = aws_s3_bucket.frontend_bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "frontend_bucket_public_access" {
  bucket = aws_s3_bucket.frontend_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
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
  bucket = aws_s3_bucket.frontend_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_website_configuration" "frontend_bucket_website_config" {
  bucket = aws_s3_bucket.frontend_bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}