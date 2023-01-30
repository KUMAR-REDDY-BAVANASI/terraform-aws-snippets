# Terraform AWS Classic Load Balancer (lb-CLB) Outputs

output "alb_id" {
  description = "The DNS name of the lb"
  value       = aws_lb.new-alb.id
}

output "alb_dns_name" {
  description = "The DNS name of the lb"
  value       = aws_lb.new-alb.dns_name
}

output "alb_zone_id" {
  description = "The canonical hosted zone ID of the lb (to be used in a Route 53 Alias record)"
  value       = aws_lb.new-alb.zone_id
}