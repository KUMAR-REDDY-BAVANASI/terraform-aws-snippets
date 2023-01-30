resource "aws_instance" "ec2_jenkins" {
  ami           = lookup(var.ami_id, var.aws_region)
  instance_type = var.type

  # Existing Subnet assign to instance
  subnet_id = var.subnet_id

  # Security group assign to instance
  vpc_security_group_ids = [aws_security_group.jenkins-security-group.id]

  # key name
  key_name = "dev-aws-key"
  
  # Cloud Init/Boot/User data
  user_data = file("Install-Jenkins.sh")

  tags = {
    Name = "${var.envname}-Jenkins"
  }
}

