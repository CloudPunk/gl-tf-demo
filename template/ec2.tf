resource "aws_instance" "example" {
  ami           = "ami-01e60b66eb705ae08"
  instance_type = "t2.micro"
  user_data = data.template_file.bootstrap.rendered

  tags = {
    Name = var.project
  }
}