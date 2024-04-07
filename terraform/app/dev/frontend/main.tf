module "dev_frontend_s3" {
    source = "../../../modules/app/s3/frontend-bucket"
    frontend_bucket_name = var.frontend_bucket_name
  
}

module "dev_cloudfront_log_s3_bucket" {
    source = "../../../modules/app/s3/cloudfront-log-bucket"
    cloudfront_log_bucket_name = var.cloudfront_log_s3_bucket
  
}

module "dev_frontend_bucket_with_cdn" {
    source = "../../../modules/app/s3/frontend-bucket-with-cdn"
    frontend_bucket_with_cdn_name = var.frontend_bucket_with_cdn_name
    cloudfront_s3_bucket_policy = file(var.cloudfront_s3_bucket_policy)
  
}

module "dev_cloudfront_dist" {
    source = "../../../modules/app/cloudfront"
    cloudfront_origin_s3_bucket = module.dev_frontend_bucket_with_cdn.frontend_s3_with_cdn_bucket_regional_domain_name
    cloudfront_log_s3_bucket = module.dev_cloudfront_log_s3_bucket.cloudfront_log_s3_bucket_domain_name
    cloudfront_dist_name = var.cloudfront_dist_name
    environment = var.environment
}