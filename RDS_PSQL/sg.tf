# Security Group for DB instance
resource "aws_security_group" "rds-security-group" {
  name        = "RDS Security Group"
  description = "Allow rds inbound traffic"
  vpc_id      = var.vpc_id

  ingress {
    description = "rds from VPC"
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    # security_groups = var.bastion_security_group_id
    cidr_blocks = ["10.1.0.0/16"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "${var.envname}-rds-sg"
  }

}