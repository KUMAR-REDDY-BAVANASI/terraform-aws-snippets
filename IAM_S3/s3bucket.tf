# Creates s3 bucket
resource "aws_s3_bucket" "custom-s3-bucket-0123" {
  bucket = "custom-s3-bucket-0123"
  acl    = "private"

  tags = {
    "Name" = "bucket_demo"
  }
}
