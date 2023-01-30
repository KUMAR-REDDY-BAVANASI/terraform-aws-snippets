# # Define Launch configuration
resource "aws_launch_configuration" "custom_launch_conf" {
  name          = "custom_launch_conf"
  image_id      = data.aws_ami.amzlinux2.id
  instance_type = "t2.micro"
  key_name      = aws_key_pair.dev-aws.key_name

  security_groups = [aws_security_group.custom-instance-sg.id]

  user_data = file("install-httpd.sh")

  lifecycle {
    create_before_destroy = false
  }
}