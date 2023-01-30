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

variable "r53_dns_zone_id" {
  type        = string
  description = "The id of dns hosted zone."
  default     = "{}"
}

variable "ec2_record_name" {
  type        = string
  description = "The ec2 record of dns hosted zone."
  default     = "{}"
}

variable "lb_record_name" {
  type        = string
  description = "The lb record of dns hosted zone."
  default     = "{}"
}

variable "lb_dns_name" {
  type        = string
  description = "The load balancer dns name."
  default     = "{}"
}

variable "lb_zone_id" {
  type        = string
  description = "The load balancer zone id"
  default     = "{}"
}
