
# db subnet group
resource "aws_db_subnet_group" "psqldb-subnet" {
  name       = "psqldb-subnet"
  subnet_ids = var.database_subnets.*

  tags = {
    Name = "${var.envname}-PSQLDB-subnet-group"
  }
}

# mysql database creation
resource "aws_db_instance" "postgresql" {
  identifier             = var.db_hostname
  engine                 = var.engine_name
  engine_version         = var.psql_version
  instance_class         = var.instance_class
  storage_type           = var.storage_type
  allocated_storage      = var.allocated_storage
  multi_az               = var.multi_availability_zone
  name                   = var.my_database
  username               = var.username
  password               = var.password
  parameter_group_name   = var.parameter_group
  deletion_protection    = var.deletion_protection
  skip_final_snapshot    = var.skip_final_snapshot
  db_subnet_group_name   = aws_db_subnet_group.psqldb-subnet.name
  vpc_security_group_ids = ["${aws_security_group.rds-security-group.id}"]

  tags = {
    Name = "${var.envname}-psqldb"
  }
}