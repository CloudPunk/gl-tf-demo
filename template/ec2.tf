resource "aws_instance" "example" {
  #ami           = data.aws_ami.amzn2.id
  ami           = 'ami-0bb8e197ca205fdb2'
  instance_type = "t2.micro"
  user_data = data.template_file.bootstrap.rendered

  tags = {
    Name = "ExampleInstance"
  }
}