# Security Group for DB instance
resource "aws_security_group" "rds-mysql-security-group" {
  name        = "RDS MYSQL Security Group"
  description = "Allow rds inbound traffic"
  vpc_id      = var.vpc_id

  ingress {
    description = "rds from VPC"
    from_port   = 3306
    to_port     = 3306
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
    Name = "${var.envname}-rds-mysql-sg"
  }

}