
resource "aws_instance" "web-server" {
  ami                    = lookup(var.ami_id, var.region)
  instance_type          = var.type
  subnet_id              = var.subnet_id
  key_name               = "aws_key_1"
  vpc_security_group_ids = ["${aws_security_group.web-security-group.id}"]

  user_data = <<EOF
   #! /bin/bash
   sudo yum update -y
   sudo yum install -y httpd
   sudo service httpd start
   sudo service httpd enable
   echo "<h1>Deployed via Terraform</h1>" >> /var/www/html/index.html
  EOF

  tags = {
    "Name" = "${var.envname}-webServer"
  }
}

resource "aws_eip" "eip" {
  instance = aws_instance.web-server.id
  vpc      = true

  tags = {
    "Name" = "${var.envname}-eip2"
  }
}