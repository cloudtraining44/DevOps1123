#variable "access_key" {}

#variable "secret_access_key" {}

variable "port" {
  type = list
  default = [22,80,443,8080]
}

variable "Env" {
  default = "dev"
}

variable "igw_tags" {
  type = map
  default = {
    "Owner" = "terraform"
  }
}