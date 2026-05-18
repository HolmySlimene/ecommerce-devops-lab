resource "aws_instance" "web" {
  count         = 2
  ami           = "ami-0c02fb55956c7d316"
  instance_type = "t2.micro"
  key_name      = "vockey"

  associate_public_ip_address = true

  tags = {
    Name = "devops-instance"
  }
}
