output "cloudfront_id" {
    value = aws_cloudfront_distribution.cloudfront_dist.id
  
}

output "cloudfront_domain_name" {
    value = aws_cloudfront_distribution.cloudfront_dist.domain_name
  
}

output "cloudfront_dist_origin_access_identity" {
    value = aws_cloudfront_origin_access_identity.cloudfront_dist_oai.cloudfront_access_identity_path
  
}

output "cloudfront_oai_iam_arn" {
    value = aws_cloudfront_origin_access_identity.cloudfront_dist_oai.iam_arn
  
}