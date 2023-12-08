provider "aws" {
  #version = "> 2.54"
  region = "eu-west-1"
}

provider "digitalocean" {}

terraform {
  #required_version = "> 0.12.31"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.30.0"
    }
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "2.32.0"
    }
  }
}


resource "aws_eip" "kplabs_app_ip" {
  domain = "vpc"
}

output "myEIP" {
  value = aws_eip.kplabs_app_ip.public_ip
}