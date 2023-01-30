output "bucket_name" {
  value = aws_s3_bucket.b1.bucket_domain_name
}


output "object_id" {
    value = aws_s3_bucket_object.object.id
}


# output "object_id" {
#   value = [for object in aws_s3_bucket_object.object : object.id]
# }