output "nlb_dns_name" {
  description = "The DNS name of the load balancer."
  value       = aws_lb.new-nlb.dns_name
}

output "nlb_zone_id" {
  description = "The zone_id of the load balancer to assist with creating DNS records."
  value       = aws_lb.new-nlb.zone_id
}

output "nlb_id" {
  description = "The DNS name of the lb"
  value       = aws_lb.new-nlb.id
}
