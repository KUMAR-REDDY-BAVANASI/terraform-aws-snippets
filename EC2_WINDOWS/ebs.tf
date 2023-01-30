resource "aws_ebs_volume" "example" {
  availability_zone = var.azs[2]
  size              = 40
  type              = "gp2"

  tags = {
    "Name" = "${var.envname}-windows-ebs"
  }
}

resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.example.id
  instance_id = aws_instance.example.id
}