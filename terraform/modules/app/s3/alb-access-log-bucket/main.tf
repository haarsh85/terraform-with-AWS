resource "aws_s3_bucket" "alb_access_log_bucket" {
    bucket = var.alb_access_log_bucket_name

    tags = {
      Name = var.alb_access_log_bucket_name
      Application = "alb-access-logs"
      ManagedBy = "terraform"
    }
}

resource "aws_s3_bucket_ownership_controls" "alb_access_log_bucket_ownership" {
  bucket = aws_s3_bucket.alb_access_log_bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}