variable "access_key" {}

variable "secret_access_key" {}

variable "Env" {}

variable "data.aws_subnet.public.id" {}

variable "port" {
  type = list
  default = [22,80,443]
}