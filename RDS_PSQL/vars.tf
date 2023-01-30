# Input Variables

variable "envname" {
  default     = "{}"
  type        = string
  description = "Name of environment this Database is targeting"
}

variable "aws_region" {
  type        = string
  description = "The name of the region you wish to deploy into"
  default     = "{}"
}

variable "vpc_id" {
  type        = string
  description = "ID of VPC meant to house database"
  default     = "{}"
}

variable "database_subnets" {
  type        = list(string)
  description = "subnet ids for mysqldb instance"
  default     = [""]
}

/*
variable "bastion_security_group_id" {
  type        = list(string)
  description = "security group id for mysqldb instance"
  default     = [""]
}
*/

variable "username" {
  type        = string
  description = "Name of user inside storage engine"
  default     = "{}"
}

variable "password" {
  type        = string
  description = "Database password inside storage engine"
  default     = "{}"
}

variable "db_hostname" {
  type        = string
  description = "Identifier for RDS instance"
  default     = "{}"
}

variable "my_database" {
  type        = string
  description = "Name of database inside storage engine"
  default     = "{}"
}

variable "engine_name" {
  type        = string
  description = "database engine name for mysqldb instance"
  default     = "{}"
}

variable "psql_version" {
  type        = string
  description = "Database engine version"
  default     = "{}"
}

variable "storage_type" {
  type        = string
  description = "Type of underlying storage for database"
  default     = "{}"
}
variable "instance_class" {
  type        = string
  description = "Instance type for database instance"
  default     = "{}"
}

variable "parameter_group" {
  default     = "{}"
  type        = string
  description = "Database engine parameter group"
}

variable "allocated_storage" {
  default     = 20
  type        = number
  description = "Storage allocated to database instance"
}

variable "multi_availability_zone" {
  default     = true
  type        = bool
  description = "Flag to enable hot standby in another availability zone"
}


variable "deletion_protection" {
  default     = true
  type        = bool
  description = "Flag to protect the database instance from deletion"
}

variable "skip_final_snapshot" {
  default     = true
  type        = bool
  description = "Flag to enable or disable a snapshot if the database instance is terminated"
}

