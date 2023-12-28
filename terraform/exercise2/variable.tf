variable "access_key" {
			  default = ""
			  type = string
			}

			variable "secret_key" {
			  default = ""
			  type = string
			}

            variable "ami"{
                default = "ami-0759f51a90924c166"
                type = string

            }

            variable "instance_type"{
                default = "t2.micro"
                type = string

            }

            variable "Name"{
                default = "var.tagname"
                type = string

            }

            variable "Owner"{
                default = "Terraform"
                type = string

            }

            variable "name"{
                default = "Web-SG-01"
                type = string

            }

            variable "description"{
                default = "Web-SG-01"
                type = string

            }