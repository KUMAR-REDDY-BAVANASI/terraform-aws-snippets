# For EC2
resource "aws_autoscaling_group" "custom-group-autoscaling" {
  name                      = "custom-group-autoscaling"
  vpc_zone_identifier       = [data.aws_subnet.example.id]
  launch_configuration      = aws_launch_configuration.custom_launch_conf.name
  max_size                  = 4
  min_size                  = 2
  desired_capacity          = 2
  health_check_grace_period = 100
  health_check_type         = "ELB"
  force_delete              = true

  load_balancers = [aws_elb.custom-elb.name]

  tag {
    key                 = "Name"
    value               = "custom-ec2-instance"
    propagate_at_launch = true
  }
}
