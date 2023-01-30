#SecurityGroup for windows
resource "aws_security_group" "windows-security-group" {
  name        = "Windows Security Group"
  description = "Enable RDP access on port "
  vpc_id      = var.vpc_id
  ingress {
    description = "Allow RDP"
    from_port   = 3389 #  By default, the windows server listens on TCP port 3389 for RDP
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "${var.envname}-Windows-SG"
  }
}
