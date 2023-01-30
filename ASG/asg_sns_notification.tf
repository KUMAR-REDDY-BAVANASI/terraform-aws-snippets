# # Autoscaling Notifications
# ## SNS - Topic
# resource "aws_sns_topic" "custom-sns-topic" {
#   name = "custom-sns-topic"
# }

# ## SNS - Subscription
# resource "aws_sns_topic_subscription" "custom-sns-topic-subscription" {
#   topic_arn = aws_sns_topic.custom-sns-topic.arn
#   protocol  = "email"
#   endpoint  = "kumar.b@bosframework.com"
# }

# ## Create Autoscaling Notification Resource
# resource "aws_autoscaling_notification" "custom-notifications" {
#   group_names = [aws_autoscaling_group.custom-group-autoscaling.id]
#   notifications = [
#     "autoscaling:EC2_INSTANCE_LAUNCH",
#     "autoscaling:EC2_INSTANCE_TERMINATE",
#     "autoscaling:EC2_INSTANCE_LAUNCH_ERROR",
#     "autoscaling:EC2_INSTANCE_TERMINATE_ERROR",
#   ]
#   topic_arn = aws_sns_topic.custom-sns-topic.arn
# }

