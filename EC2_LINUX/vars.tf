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

variable "ami" {
  type        = string
  description = "The ami of ec2"
  default     = "{}"
}

variable "type" {
  type        = string
  description = "type of Ec2 instance"
  default     = "{}"
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

variable "azs" {
  description = "A list of Availability zones inside the region"
  type        = list(string)
  default     = [""]
}



