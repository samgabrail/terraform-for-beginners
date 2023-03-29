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

resource "aws_key_pair" "mykey" {
  key_name   = var.my_aws_key
  public_key = module.tls.public_key_out
}

resource "aws_instance" "webserver" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.my_instance_type
  key_name                    = aws_key_pair.mykey.key_name
  vpc_security_group_ids      = [aws_security_group.security_group1.id]
  user_data                   = file("install_libraries.sh")
  user_data_replace_on_change = true
}

resource "aws_security_group" "security_group1" {
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "SSH Ingress"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
  }
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTP Ingress"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"

  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

module "tls" {
  source = "./modules/tls"
}
