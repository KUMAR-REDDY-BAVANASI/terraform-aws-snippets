output "aws_s3_bucket_name" {
    description = "The Name of Bucket"
    value = aws_s3_bucket.terraform-state-storage-s3.bucket_domain_name 
}

output "aws_dynamodb_table_name" {
    description = "The Name of Bucket"
    value = aws_dynamodb_table.dynamodb-terraform-state-lock.name
}