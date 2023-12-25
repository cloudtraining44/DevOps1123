provider "aws" {
  region = "us-east-1"
  access_key = var.access_key
  secret_key = var.secret_key
}

resource "aws_instance" "demo-instance" {
  ami                    = var.ami
  instance_type          = var.instance_type
  
  tags = {
	Name  = "demo"
	Owner = "Terraform"
  }
}

