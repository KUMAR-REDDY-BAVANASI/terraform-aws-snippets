# AWS EC2 Instance Terraform Outputs
# Public EC2 Instances - example Host

output "aws_instance_id" {
  description = "List of IDs of instances"
  value       = aws_instance.example.id
}

output "aws_instance_public_ip" {
  description = "List of public IP addresses assigned to the instances"
  value       = aws_instance.example.public_ip
}
