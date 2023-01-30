# ALB Creation
resource "aws_lb" "new-alb" {
  name               = "new-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = ["${aws_security_group.alb-security-group.id}"]
  subnets            = [var.public_subnets[0], var.public_subnets[1]]
  # subnets         = var.public_subnets.*

  enable_deletion_protection = false

  tags = {
    Name = "${var.envname}-alb"
  }
}


# instance target group

resource "aws_lb_target_group" "new-alb-tg" {
  name     = "new-alb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}


resource "aws_lb_target_group_attachment" "new-alb" {
  target_group_arn = aws_lb_target_group.new-alb-tg.arn
  target_id        = var.instance_id
  port             = 8080
}



# listner
resource "aws_lb_listener" "back_end" {
  load_balancer_arn = aws_lb.new-alb.arn
  port              = "80"
  protocol          = "HTTP"


  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.new-alb-tg.arn
  }
}

