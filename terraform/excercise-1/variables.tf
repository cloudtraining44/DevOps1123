variable "access_key" {
  default = ""
  type = string
}

variable "secret_key" {
  default = ""
  type = string
}

variable "ami" {
    default = "ami-0759f51a90924c166"
    type = string
}

variable instance_type {
    default = "t3.micro"
    type = string
}