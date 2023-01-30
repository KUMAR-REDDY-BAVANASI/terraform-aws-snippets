# AWS EC2 LB Security Group Terraform Outputs

# Public Bastion Host Security Group Outputs
## public_bastion_sg_group_id
output "load_balancer_sg_group_id" {
  description = "The ID of the security group"
  value       = aws_security_group.elb-security-group.id
}

## public_bastion_sg_group_vpc_id
output "load_balancer_sg_group_vpc_id" {
  description = "The VPC ID"
  value       = aws_security_group.elb-security-group.vpc_id
}

## public_bastion_sg_group_name
output "load_balancer_sg_group_name" {
  description = "The name of the security group"
  value       = aws_security_group.elb-security-group.name
}