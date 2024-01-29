variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "access_key" {}

variable "secret_access_key" {}

variable "port" {
  type = list
  default = [22,80,443,8080]
}

variable "Env" {
  default = "dev"
}