provider "aws" {
  region = "us-east-1"
}

# ✅ Security Group (SSH + HTTP)
resource "aws_security_group" "web_sg" {
  name = "web-sg"

  ingress {
    description = "SSH access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP access"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# ✅ EC2 Instances
resource "aws_instance" "web" {
  count         = 2
  ami           = "ami-0c02fb55956c7d316"
  instance_type = "t2.micro"
  key_name      = "vockey"

  associate_public_ip_address = true

  vpc_security_group_ids = [aws_security_group.web_sg.id]

  tags = {
    Name = "devops-instance"
  }

  # ✅ BONUS PRO (lifecycle)
  lifecycle {
    create_before_destroy = true
  }
}

# ✅ Output IPs
output "instance_public_ips" {
  value = aws_instance.web[*].public_ip
}
``
