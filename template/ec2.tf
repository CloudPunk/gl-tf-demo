resource "aws_instance" "example" {
  ami           = data.aws_ami.amzn2.id
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleInstance"
  }
}