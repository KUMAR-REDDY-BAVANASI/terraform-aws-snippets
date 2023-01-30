# Create a new load balancer
resource "aws_elb" "new-elb" {
  name            = "new-elb"
  security_groups = ["${aws_security_group.elb-security-group.id}"]
  subnets         = var.public_subnets.*

  listener {
    instance_port     = 8080
    instance_protocol = "HTTP"
    lb_port           = 80
    lb_protocol       = "HTTP"
  }

  /*
  listener {
    instance_port      = 8000
    instance_protocol  = "http"
    lb_port            = 443
    lb_protocol        = "https"
    ssl_certificate_id = "arn:aws:iam::123456789012:server-certificate/certName"
  }
  */

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
    target              = "TCP:8080"
    interval            = 30
  }

  instances                   = ["${var.instance_id}"]
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

  tags = {
    Name = "${var.envname}-elb"
  }
}

