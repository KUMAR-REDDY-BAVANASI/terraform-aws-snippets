# ec2 
resource "aws_instance" "WebServer" {
  ami                    = var.ami
  instance_type          = var.type
  subnet_id              = var.subnet_id
  key_name               = aws_key_pair.dev-aws.id
  iam_instance_profile   = aws_iam_instance_profile.custom-s3-bucket-role-instance-profile.name
  vpc_security_group_ids = ["${aws_security_group.web-security-group.id}"]

  tags = {
    Name = "${var.envname}-WebServer"
  }
}