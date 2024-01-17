#EC2 instance using UserData
provider "aws" {
  region = "us-east-1"
  access_key = var.access_key
  secret_key = var.secret_access_key
}

resource "aws_instance" "webserver" {
  ami                    = "ami-0759f51a90924c166"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.web-sg-01.id]
  user_data              = "${file("userdata_web.sh")}"
  subnet_id              = "data.aws_subnet.public.id"
    associate_public_ip_address = true

  tags = {
    Name  = "${var.Env}-Web-01"
    Owner = "Terraform"
  }
}

resource "aws_instance" "app-server" {
  ami                    = "ami-0759f51a90924c166"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.web-sg-01.id]
  subnet_id              = "data.aws_subnet.public.id"

  tags = {
    Name  = "${var.Env}-App-01"
    Owner = "Terraform"
  }
}

data "aws_vpc" "vpc_lookup" {
  filter {
    name   = "tag:Name"
    values = ["${var.Env}-vpc"]
  }
}

data "aws_subnet" "public" {
  filter {
    name   = "tag:Name"
    values = ["${var.Env}-PublicSubnet"]
  }
}

#Security Group Resource to open port 80 
resource "aws_security_group" "web-sg-01" {
  name        = "${var.Env}-SG"
  description = "Web-SG-01"
  vpc_id      = data.aws_vpc.vpc_lookup.id

  dynamic ingress {
    for_each = var.port

    content {
    description      = "from Everywhere"
    from_port        = ingress.value
    to_port          = ingress.value
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
 }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}

output "public_ip" {
  value = aws_instance.webserver.public_ip
}

output "private_ip" {
  value = aws_instance.app-server.public_ip
}