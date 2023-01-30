# terraform state file setup
# create an S3 bucket to store the state file in
resource "aws_s3_bucket" "terraform-state-storage-s3" {
  bucket = "tf-state-remote-s3"
  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy = false
  }

  tags = {
    Name = "S3 Remote Terraform State Store"
  }
}

# create a dynamodb table for locking the state file
resource "aws_dynamodb_table" "dynamodb-terraform-state-lock" {
  name           = "terraform-state-lock-dynamo"
  hash_key       = "LockID"
  read_capacity  = 20
  write_capacity = 20

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name = "DynamoDB Terraform State Lock Table"
  }
}


# # Creates S3 backend
# terraform {
#   backend "s3" {
#     encrypt        = true
#     bucket         = "tf-state-remote-s3"
#     region         = "ap-south-1"
#     dynamodb_table = "terraform-state-lock-dynamo"
#     key            = "services/server.tfstate"
#   }
# }


