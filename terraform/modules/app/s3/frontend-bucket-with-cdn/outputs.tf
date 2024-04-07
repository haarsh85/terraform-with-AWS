output "frontend_s3_with_cdn_bucket_domain_name" {
    value = aws_s3_bucket.frontend_bucket_with_cdn.bucket_domain_name
  
}

output "frontend_s3_with_cdn_bucket_regional_domain_name" {
    value = aws_s3_bucket.frontend_bucket_with_cdn.bucket_regional_domain_name
  
}