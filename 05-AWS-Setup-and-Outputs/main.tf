terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.19.0"
    }
  }
}

provider "aws" {
  region = var.region
}

resource "aws_instance" "webserver" {
  ami           = "ami-08d4ac5b634553e16"
  instance_type = var.my_instance_type
}

output "public_ip" {
  value       = aws_instance.webserver.public_ip
  description = "EC2 Public IP"
}
