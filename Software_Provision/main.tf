
resource "aws_instance" "web-server" {
  ami                    = lookup(var.ami_id, var.region)
  instance_type          = "t2.micro"
  subnet_id              = var.subnet_id
  key_name               = "aws_key"
  vpc_security_group_ids = ["${aws_security_group.web-security-group.id}"]

  provisioner "file" {
    source      = "index.html" # you can also use "content" argumnent 
    destination = "/tmp/index.html"
  }

  provisioner "local-exec" {
    command = "touch hello-jhooq.txt"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum update -y",
      "sudo yum install -y httpd;sudo cp /tmp/index.html /var/www/html/",
      "sudo service httpd restart",
      "sudo service httpd status"
    ]
  }
  connection {
    type        = "ssh"
    host        = aws_instance.web-server.public_ip
    user        = "ec2-user"
    private_key = file("C:\\Users\\kumarreddy\\.ssh\\id_rsa")

  }

  tags = {
    "Name" = "${var.envname}-webServer"
  }
}

