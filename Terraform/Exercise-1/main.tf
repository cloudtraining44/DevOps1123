provider "aws" {
			  region = "us-east-1"
			  access_key = var.access_key
			  secret_key = var.secret_key
			}

			resource "aws_instance" "demo-instance" {
			  ami                    = "ami-079db87dc4c10ac91"
			  instance_type          = "t2.micro"
			  
			  tags = {
				Name  = "demo"
				Owner = "Terraform"
			  }
			}