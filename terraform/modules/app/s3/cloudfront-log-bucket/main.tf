resource "aws_s3_bucket" "cloudfront_log_bucket" {
    bucket = var.cloudfront_log_bucket_name

    tags = {
      Name = var.cloudfront_log_bucket_name
      Application = "cloudfront-logs"
      ManagedBy = "terraform"
    }
}

resource "aws_s3_bucket_ownership_controls" "cloudfront_logs_s3_bucket_ownership" {
  bucket = aws_s3_bucket.cloudfront_log_bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}