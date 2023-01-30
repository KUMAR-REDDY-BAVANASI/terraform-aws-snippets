# VPC Output Values

# VPC ID
output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.myvpc.id
}

# VPC CIDR blocks
output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = aws_vpc.myvpc.cidr_block
}

# VPC Private Subnets
output "private_subnets" {
  description = "List of IDs of private subnets"
  value       = aws_subnet.vpc_private_subnets.*.id
}

# VPC Public Subnets
output "public_subnets" {
  description = "List of IDs of public subnets"
  value       = aws_subnet.vpc_public_subnets.*.id
}

# VPC Database Subnets
output "database_subnets" {
  description = "List of IDs of database subnets"
  value       = aws_subnet.vpc_database_subnets.*.id
}

# VPC NAT gateway Public IP
output "nat_public_ips" {
  description = "List of public Elastic IPs created for AWS NAT Gateway"
  value       = aws_eip.natIp.public_ip
}

# VPC AZs
output "azs" {
  description = "A list of availability zones spefified as argument to this module"
  value       = var.vpc_availability_zones
}