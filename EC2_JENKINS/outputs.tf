output "aws_instance_id" {
  description = "List of IDs of instances"
  value = aws_instance.ec2_jenkins.id
}

/*
output "aws_instance_public_ip" {
  value = aws_instance.ec2_jenkins.public_ip
}
*/

output "aws_instance_private_ip" {
  description = "private IPs of instances"
  value = aws_instance.ec2_jenkins.private_ip
}
