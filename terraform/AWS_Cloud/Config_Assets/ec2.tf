#EC2 instance using UserData

resource "aws_instance" "webserver" {
  ami                    = "ami-0759f51a90924c166"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.web-sg-01.id]
  user_data              = "${file("userdata_web.sh")}"
  subnet_id              = "subnet-08ae094d0d8474b10"
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
  subnet_id              = "subnet-084caac5afb133769"

  tags = {
    Name  = "${var.Env}-App-01"
    Owner = "Terraform"
  }
}

data "aws_vpc" "vpc_lookup" {
  filter {
    name   = "tag:Name"
    values = ["${Env}-vpc"]
  }
}

#Security Group Resource to open port 80 
resource "aws_security_group" "web-sg-01" {
  name        = "${var.Env}-SG"
  description = "Web-SG-01"
  vpc_id      = data.aws_vpc.vpc_lookup.id

  ingress {
    description      = "Port 80 from Everywhere"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

    ingress {
    description      = "ssh from Everywhere"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]

  }

    ingress {
    description      = "Port 80 from Everywhere"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
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