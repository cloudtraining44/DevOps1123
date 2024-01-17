variable "access_key" {}

variable "secret_access_key" {}

variable "Env" {}

variable "subnet_id" {}

variable "port" {
  type = list
  default = [22,80,443]
}