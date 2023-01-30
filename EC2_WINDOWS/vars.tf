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

variable "azs" {
  description = "A list of Availability zones inside the region"
  type        = list(string)
  default     = [""]
}

variable "vpc_id" {
  type        = string
  description = "vpc id for ec2 instance"
  default     = "{}"
}

variable "subnet_id" {
  type        = string
  description = "subnet id for ec2 instance"
  default     = "{}"
}