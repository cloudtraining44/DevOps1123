terraform {

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.47.0"
    }
  }
  required_version = "~> 1.3"
}

provider "aws" {
  region = "us-east-1"
#  access_key = var.access_key
#  secret_key = var.secret_access_key
}