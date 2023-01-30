# Psql Variables

envname    = "dev-aws"
aws_region = "ap-south-1"
vpc_id     = "vpc-0a4ad433a76216f11"
# database_subnets        = ["10.1.6.0/24", "10.1.7.0/24", "10.1.8.0/24"]
database_subnets = ["subnet-0a400b61b21322655", "subnet-0f68e5033212135a4", "subnet-0bfbab5b0545e22bb"]
# bastion_security_group_id = ["sg-03f565ae363f6da7f"]
username                = "kumar5483reddy"
password                = "admin123"
db_hostname             = "prod-mysql"
my_database             = "firstdb"
engine_name             = "postgres"
psql_version            = "11.10"
storage_type            = "gp2"
instance_class          = "db.t3.micro"
parameter_group         = "default.postgres11"
allocated_storage       = 20
multi_availability_zone = true
deletion_protection     = true
skip_final_snapshot     = true