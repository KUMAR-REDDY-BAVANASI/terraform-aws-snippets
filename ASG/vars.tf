variable "public_subnets" {
  type        = list(string)
  description = "subnet ids assigning for load balancers"
  default     = [""]
}

variable "vpc_id" {
  type        = string
  description = "vpc id for ec2 instance"
  default     = "{}"
}