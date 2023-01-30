# Hosted Zone Public

# resource "aws_route53_zone" "easy_aws" {
#   name = "cloudkumar.site"

#   tags = {
#     Environment = "dev"
#   }
# }

# DNS Registration 
# A Record with Ec2 Public IP
resource "aws_route53_record" "ec2" {
  zone_id = var.r53_dns_zone_id
  name    = var.ec2_record_name
  type    = "A"
  ttl     = "30"
  records = [aws_eip.eip.public_ip]

}

# DNS Registration 
# A Record with Load balancer dns name

# resource "aws_route53_record" "alb" {
#   zone_id = var.r53_dns_zone_id
#   name    = var.lb_record_name
#   type    = "A"

#   alias {
#     name                   = var.lb_dns_name
#     zone_id                = var.lb_zone_id
#     evaluate_target_health = true
#   }

# }


