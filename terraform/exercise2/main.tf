provider "aws" {
  region = "us-east-1"
  access_key = var.access_key
  secret_key = var.secret_key
}


resource "aws_instance" "demo-instance" {
  ami                    = ""
  instance_type          = ""

  vpc_security_group_ids = [aws_security_group.web-sg-01.id]
  tags = {
    Name  = ""
    Owner = ""
  }
}

#Security Group Resource to open port 80 
resource "aws_security_group" "web-sg-01" {
  name        = ""
  description = ""

    ingress {
    description      = "ssh from Everywhere"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}