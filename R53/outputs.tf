
# output "name_server" {
#   value = aws_route53_zone.easy_aws.name_servers
# }


output "dns_name_ec2" {
  value = aws_route53_record.ec2.name
}

# output "dns_name_lb" {
#   value = aws_route53_record.alb.name
# }

output "public_ip" {
  value = aws_instance.web-server.public_ip
}