#SecurityGroup for ALB
resource "aws_security_group" "custom-elb-sg" {
  name        = "custom-elb-sg"
  description = "Enable Http/Https access on port 80/443"
  vpc_id      = var.vpc_id
  ingress {
    description = "HTTP access"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "HTTPS access"
    from_port   = 443
    to_port     = 443
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
    Name = "custom-elb-sg"
  }
}

#SecurityGroup for Instances
resource "aws_security_group" "custom-instance-sg" {
  name        = "custom-instance-sg"
  description = "Security group for instances"
  vpc_id      = var.vpc_id
  ingress {
    description     = "SSH access"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.custom-elb-sg.id]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "custom-instance-sg"
  }
}