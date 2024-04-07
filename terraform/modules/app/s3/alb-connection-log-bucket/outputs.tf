output "alb_connection_s3_bucket_name" {
    value = aws_s3_bucket.alb_connection_log_bucket.id
  
}