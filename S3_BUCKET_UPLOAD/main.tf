# Create a bucket
resource "aws_s3_bucket" "b1" {
  bucket = "terraform-1432"
  acl    = "private" # or can be "public-read"
  versioning {
    enabled = false
  }
  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}


# Upload an object
resource "aws_s3_bucket_object" "object" {
  bucket = aws_s3_bucket.b1.id
  key    = "file.txt"
  acl    = "private" # or can be "public-read"
  source = "myfiles/file.txt"
  etag   = filemd5("myfiles/file.txt")
}



# # Upload multiple objects
# resource "aws_s3_bucket_object" "object" {
#   for_each = fileset("myfiles/", "*")
#   bucket   = aws_s3_bucket.b1.id
#   key      = each.value
#   acl      = "public-read-write" # or can be "public-read"
#   source   = "myfiles/${each.value}"
#   etag     = filemd5("myfiles/${each.value}")
# }





