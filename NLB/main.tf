# ALB Creation
resource "aws_lb" "new-nlb" {
  name               = "new-nlb"
  internal           = false
  load_balancer_type = "network"
  subnets            = var.public_subnets.*

  enable_deletion_protection = false

  tags = {
    Name = "${var.envname}-nlb"
  }
}


# instance target group

resource "aws_lb_target_group" "new-nlb-tg" {
  name     = "new-nlb-tg"
  port     = 80
  protocol = "TCP"
  vpc_id   = var.vpc_id
}


resource "aws_lb_target_group_attachment" "new-nlb" {
  target_group_arn = aws_lb_target_group.new-nlb-tg.arn
  target_id        = var.instance_id
  port             = 8080
}



# listner
resource "aws_lb_listener" "back_end" {
  load_balancer_arn = aws_lb.new-nlb.arn
  port              = "80"
  protocol          = "TCP"


  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.new-nlb-tg.arn
  }
}








