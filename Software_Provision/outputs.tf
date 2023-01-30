# AWS EC2 Instance Terraform Outputs
# Public EC2 Instances - Bastion Host

output "aws_instance_id" {
  description = "List of IDs of instances"
  value = aws_instance.web-server.id
}

output "aws_instance_public_ip" {
  description = "List of public IP addresses assigned to the instances"
  value = aws_instance.web-server.public_ip
}
