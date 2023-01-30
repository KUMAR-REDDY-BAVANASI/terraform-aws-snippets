# Input Variables

variable "envname" {
  type        = string
  description = "The name of the resources"
  default     = "{}"
}

variable "aws_region" {
  type        = string
  description = "The name of the region you wish to deploy into"
  default     = "{}"
}

variable "vpc_id" {
  type        = string
  description = "vpc id for ec2 instance"
  default     = "{}"
}

variable "public_subnets" {
  type        = list(string)
  description = "subnet id for ec2 instance"
  default     = [""]
}

variable "instance_id" {
  type        = string
  description = "The ec2 instance id "
  default     = "{}"
}
