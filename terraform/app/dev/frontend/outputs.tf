output "frontend_website_s3_endpoint" {
    value = module.dev_frontend_s3.frontend_website_s3_endpoint
  
}

output "dev_frontend_bucket_with_cdn" {
  value = module.dev_frontend_bucket_with_cdn.frontend_s3_with_cdn_bucket_domain_name
  
}

output "cloudfront_dist_id" {
  value = module.dev_cloudfront_dist.cloudfront_id
}

output "cloudfront_dist_domain_name" {
  value = module.dev_cloudfront_dist.cloudfront_domain_name
}

output "cloudfront_log_bucket_name" {
  value = module.dev_cloudfront_log_s3_bucket.cloudfront_log_s3_bucket_domain_name
  
}

output "cloudfront_dist_origin_access_identity" {
  value = module.dev_cloudfront_dist.cloudfront_dist_origin_access_identity

}

output "cloudfront_oai_iam_arn" {
  value = module.dev_cloudfront_dist.cloudfront_oai_iam_arn
  
}
