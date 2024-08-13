# S3 Bucket
resource "aws_s3_bucket" "site_origin" {
  bucket = var.bucket_name

  tags = {
    Environment = var.environment
  }
}

resource "aws_s3_bucket_versioning" "site_origin" {
  bucket = aws_s3_bucket.site_origin.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_public_access_block" "site_origin" {
  bucket = aws_s3_bucket.site_origin.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_server_side_encryption_configuration" "site_origin" {
  bucket = aws_s3_bucket.site_origin.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# Upload file to S3 bucket
resource "aws_s3_object" "content" {
  bucket                 = aws_s3_bucket.site_origin.id
  key                    = "index.html"
  source                 = "./src/index.html"
  content_type           = "text/html"
  server_side_encryption = "AES256"
}





# S3 Bucket Policy
data "aws_iam_policy_document" "s3_policy" {
  statement {
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.site_origin.arn}/*"]

    principals {
      type        = "Service"
      identifiers = ["cloudfront.amazonaws.com"]
    }

    condition {
      test     = "StringEquals"
      variable = "AWS:SourceArn"
      values   = [aws_cloudfront_distribution.site_access.arn]
    }
  }
}

resource "aws_s3_bucket_policy" "site_origin" {
  bucket = aws_s3_bucket.site_origin.id
  policy = data.aws_iam_policy_document.s3_policy.json
}
