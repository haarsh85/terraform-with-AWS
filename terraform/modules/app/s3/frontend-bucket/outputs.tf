output "frontend_website_s3_bucket_name" {
    value = aws_s3_bucket.frontend_bucket.id
  
}

output "frontend_website_s3_endpoint" {
    value = aws_s3_bucket_website_configuration.frontend_bucket_website_config.website_endpoint
  
}