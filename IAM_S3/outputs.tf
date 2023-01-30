output "aws_iam_user01" {
  value = aws_iam_user.user01.name
}
output "aws_iam_user02" {
  value = aws_iam_user.user02.name
}

output "aws_iam_group_name" {
  value = aws_iam_group.developers.name
}

output "aws_instance_public_ip" {
  value = aws_instance.WebServer.public_ip
}

