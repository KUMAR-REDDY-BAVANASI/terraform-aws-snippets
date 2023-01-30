# Create volume
resource "aws_ebs_volume" "db" {
  availability_zone = var.azs[0]
  size              = 20
  type              = "gp2"

  tags = {
    "Name" = "${var.envname}-new-ebs"
  }
}

# Attach volume to instance
resource "aws_volume_attachment" "db" {
  device_name = "/dev/xvdh"
  volume_id   = aws_ebs_volume.db.id
  instance_id = aws_instance.bastion.id
}