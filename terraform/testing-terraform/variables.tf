variable "access_key" {
  default = "AKIA44EQJ67T5BA3LCPO"
  type = string
}

variable "secret_key" {
  default = "3VzxBfRlFn5WNdZ5h8iZ+B7mZFCGFZUZfQRLlIYY"
  type = string
}

variable "ami" {
  default = "ami-0759f51a90924c166"
  type = string
}

variable "name" {
  default = "training"
  type = string
}

variable "instance_info" {
  type = map(object({
    ami             = string
    instance_type   = string
  }))
  default = {
    prod-ec2  = {ami = "ami-0759f51a90924c166", instance_type = "t2.micro" }
    dev-ec2   = {ami = "ami-0759f51a90924c166", instance_type = "t2.small" }
  }
}

variable "port" {
  type = list
  default = [22,80,443]
}