# Input Variables
variable "envname" {
  type        = string
  description = "The name of the resources"
  default     = "{}"
}

variable "region" {
  type        = string
  description = "The name of the region you wish to deploy into"
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

variable "ami_id" {
  description = "The id of the ami."
  type        = map(string)
  default = {

  }
}

variable "type" {
  type        = string
  description = "The type of the ec2 instance"
  default     = "{}"
}