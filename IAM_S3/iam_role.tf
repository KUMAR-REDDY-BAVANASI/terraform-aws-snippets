# Role to access the aws s3 bucket
resource "aws_iam_role" "custom-s3-bucket-role" {
  name = "custom-s3-bucket-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}

# policy to attach the s3 bucket role
resource "aws_iam_role_policy" "custom-s3-bucket-policy" {
  name = "custom-s3-bucket-policy"
  role = aws_iam_role.custom-s3-bucket-role.id

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "s3:*",
        ]
        Effect = "Allow"
        # * means all operations you can
        # Resource = "*"
        Resource = [
          "arn:aws:s3:::custom-s3-bucket-0123",
          "arn:aws:s3:::custom-s3-bucket-0123/*"
        ]
      },
    ]
  })
}

# Instance identifier
resource "aws_iam_instance_profile" "custom-s3-bucket-role-instance-profile" {
  name = "custom-s3-bucket-role-instance-profile"
  role = aws_iam_role.custom-s3-bucket-role.name
}