#AWS Instance

resource "aws_instance" "example" {
  ami           = data.aws_ami.windows.id
  instance_type = "t3.micro"
  # Existing Subnet assign to instance
  subnet_id = var.subnet_id
  # Key Name
  key_name = aws_key_pair.dev-aws.id
  # Security group assign to instance
  vpc_security_group_ids = ["${aws_security_group.windows-security-group.id}"]

  lifecycle {
    ignore_changes = [ami]
  }

  tags = {
    Name = "${var.envname}-Windows19"
  }
}