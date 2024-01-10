variable "access_key" {}

variable "secret_key" {}

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