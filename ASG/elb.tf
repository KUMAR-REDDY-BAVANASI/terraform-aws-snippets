# Create a new load balancer AWS ELB Config
resource "aws_elb" "custom-elb" {
  name            = "custom-elb"
  subnets         = var.public_subnets.*
  security_groups = ["${aws_security_group.custom-elb-sg.id}"]

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "tcp:80"
    interval            = 30
  }

  cross_zone_load_balancing   = true
  connection_draining         = true
  connection_draining_timeout = 400

  tags = {
    Name = "custom-elb"
  }
}

output "my_elb_dns_name" {
  description = "Dns name of the load balancer"
  value = aws_elb.custom-elb.dns_name
}

