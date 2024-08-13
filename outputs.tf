output "bucket_name" {
  value = aws_s3_bucket.site_origin.bucket
}

output "cloudfront_url" {
  value = aws_cloudfront_distribution.site_access.domain_name
}