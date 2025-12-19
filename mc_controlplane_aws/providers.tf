terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~>4.11.0"
    }
    aviatrix = {
      source = "aviatrixsystems/aviatrix"
      version = "8.0.30"
    }
  }
}

provider "aws" {
  alias = "useast1"
  region = "us-east-1"
  assume_role {
    role_arn = var.aws_role_arn
  }
  access_key = var.access_key
  secret_key = var.secret_key
}
