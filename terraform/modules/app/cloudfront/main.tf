resource "aws_cloudfront_distribution" "cloudfront_dist" {
    origin {
      domain_name = var.cloudfront_origin_s3_bucket
      origin_id = var.cloudfront_origin_s3_bucket

      s3_origin_config {
        origin_access_identity = aws_cloudfront_origin_access_identity.cloudfront_dist_oai.cloudfront_access_identity_path
      }
    }
    comment = "Frontend S3 Bucket CloudFront Distribution"
    enabled = true
    is_ipv6_enabled = true
    default_root_object = "index.html"
    
    default_cache_behavior {
      allowed_methods  = ["HEAD", "GET", "POST", "DELETE", "OPTIONS", "PUT", "PATCH"]
      cached_methods = ["GET", "HEAD"]
      target_origin_id = var.cloudfront_origin_s3_bucket
      viewer_protocol_policy = "allow-all"
      compress = true

      forwarded_values {
        query_string = false

        cookies {
          forward = "none"
        }
      }
    }

    restrictions {
      geo_restriction {
        restriction_type = "none"
      }
    }

    viewer_certificate {
      cloudfront_default_certificate = true
    }

    logging_config {
      bucket = var.cloudfront_log_s3_bucket
      include_cookies = false
    }

    tags = {
      Name = var.cloudfront_dist_name
      Environment = var.environment
      ManagedBy = "terraform"
    }
  
}

resource "aws_cloudfront_origin_access_identity" "cloudfront_dist_oai" {
  comment = "Origin Access Identity for CloudFront Distribution"
}