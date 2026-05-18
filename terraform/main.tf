provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "web" {
  count         = 2
  ami           = "ami-0c02fb55956c7d316"
  instance_type = "t2.micro"
  key_name      = "vockey"

  tags = {
    Name = "devops-instance"
  }
}

output "instance_public_ips" {
  value = aws_instance.web[*].public_ip
}
