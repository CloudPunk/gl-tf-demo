data "aws_ami" "amzn2" {
  most_recent      = true
  owners           = ["amazon"]

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "name"
    values = ["amzn*"]
  }

    filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}