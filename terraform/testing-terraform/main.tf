provider "aws" {
  region = "us-east-1"
  access_key = var.access_key
  secret_key = var.secret_key
}


resource "aws_instance" "demo-instance" {

for_each = var.instance_info

  ami                    = each.value.ami
  instance_type          = each.value.instance_type

  vpc_security_group_ids = [aws_security_group.web-sg-01.id]
  tags = {
    Name  = "${var.name}"
    Owner = "Terraform"
  }
}

/*output "private_ip" {
  value = aws_instance.demo-instance[*].private_ip
}

output "id" {
  value = aws_instance.demo-instance[*].id
}*/

#Security Group Resource to open port 80 
resource "aws_security_group" "web-sg-01" {

  name        = "Web-SG-01"
  description = "Web-SG-01"

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
}