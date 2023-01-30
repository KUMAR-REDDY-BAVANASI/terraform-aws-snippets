# Creation of Ec2 Instance
resource "aws_instance" "bastion" {
  ami           = var.ami
  instance_type = var.type

  # Existing Subnet assign to instance
  subnet_id     = var.subnet_id

  # Key Name
  key_name      = aws_key_pair.dev-aws.id

  # iam_instance_profile   = aws_iam_instance_profile.admin_profile.name
  # Cloud Init/Boot/User data
  user_data              = file("install-httpd.sh")

  # Security group assign to instance
  vpc_security_group_ids = ["${aws_security_group.bastion-security-group.id}"]

  tags = {
    Name = "${var.envname}-Bastion"
  }
}

# Allocation of Elastic IP
resource "aws_eip" "ec2_eip" {
  instance = aws_instance.bastion.id
  vpc      = true

  tags = {
    Name = "${var.envname}-eip"
  }
}

data "template_file" "user_data_httpd" {
  template = file("install-httpd.sh")
}

