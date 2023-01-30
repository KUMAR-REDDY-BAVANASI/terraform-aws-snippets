
# # Define scaling Cloud watch
resource "aws_cloudwatch_metric_alarm" "custom-cpu-alarm" {
  alarm_name          = "custom-cpu-alarm"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 120
  statistic           = "Average"
  threshold           = 20
  alarm_description   = "alarm once cpu usage increases"

  dimensions = {
    "AutoScalingGroupName" : aws_autoscaling_group.custom-group-autoscaling.name
  }
  actions_enabled = true
  alarm_actions   = [aws_autoscaling_policy.custom-cpu-policy.arn]
}


# # Define Descaling Cloud watch
resource "aws_cloudwatch_metric_alarm" "custom-cpu-alarm-scaledown" {
  alarm_name          = "custom-cpu-alarm-scaledown"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 120
  statistic           = "Average"
  threshold           = 10
  alarm_description   = "alarm once cpu usage decreases"

  dimensions = {
    "AutoScalingGroupName" : aws_autoscaling_group.custom-group-autoscaling.name
  }
  actions_enabled = true
  alarm_actions   = [aws_autoscaling_policy.custom-cpu-policy-scaledown.arn]
}

# sudo amazon-linux-extras install epel -y
# sudo yum install stress -y
# stress --cpu 2 --timeout 300
