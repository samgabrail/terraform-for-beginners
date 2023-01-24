terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.19.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "4.0.0"
    }
  }
}

provider "aws" {
  region = var.region
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical https://ubuntu.com/server/docs/cloud-images/amazon-ec2
}

resource "tls_private_key" "mykey" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "mykey" {
  key_name   = "mykey.pem"
  public_key = tls_private_key.mykey.public_key_openssh
}

resource "aws_instance" "webserver" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.my_instance_type
  key_name      = aws_key_pair.mykey.key_name
  vpc_security_group_ids = [aws_security_group.security_group1.id]
}

resource "aws_security_group" "security_group1" {
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "SSH Ingress"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


# Getting the output from private key is via this command below:

# terraform output -raw private_key

# To ssh into the machine:
# terraform output -raw private_key > myKey.pem
# sudo chmod 400 myKey.pem
# ssh -i myKey.pem ubuntu@$(terraform output -raw public_ip)
