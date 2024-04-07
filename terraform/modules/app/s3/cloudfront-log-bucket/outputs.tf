output "cloudfront_log_s3_bucket_id" {
    value = aws_s3_bucket.cloudfront_log_bucket.id
  
}

output "cloudfront_log_s3_bucket_domain_name" {
    value = aws_s3_bucket.cloudfront_log_bucket.bucket_domain_name
  
}