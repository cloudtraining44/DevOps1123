#EC2 instance using UserData

resource "aws_instance" "demo-instance" {
#  ami                    = "ami-0759f51a90924c166"
  ami                    = "ami-0fe630eb857a6ec83"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.web-sg.id]
#  user_data              = "${file("userdata_web.sh")}"
  tags = {
    Name  = "${var.Env}-PostgresDB"
    Owner = "Terraform"
  }
}

#Security Group Resource to open port 80 
resource "aws_security_group" "web-sg" {
  name        = "${var.Env}-pgdb-SG"
  description = "${var.Env}-pgdb-SG"

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
  value = aws_instance.demo-instance.public_ip
}