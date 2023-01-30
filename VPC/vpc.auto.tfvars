# VPC Variables
vpc_name               = "myvpc"
vpc_cidr_block         = "10.1.0.0/16"
vpc_public_subnets     = ["10.1.0.0/24", "10.1.1.0/24", "10.1.2.0/24"]
vpc_private_subnets    = ["10.1.3.0/24", "10.1.4.0/24", "10.1.5.0/24"]
vpc_database_subnets   = ["10.1.6.0/24", "10.1.7.0/24", "10.1.8.0/24"]
vpc_availability_zones = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]