terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.1"
    }
  }
}

provider "docker" {}

resource "docker_image" "nginx_image" {
  name = "${var.image_name}:${var.image_tag}"
}

resource "docker_container" "nginx_container" {
  name  = "web-server"
  image = docker_image.nginx_image.image_id
  ports {
    internal = var.internal_port
    external = var.external_port
  }
}

variable "image_name" {
  type        = string
  description = "The name of the Docker image"
  default     = "nginx"
}

variable "image_tag" {
  type        = string
  description = "The tag of the Docker image"
  default     = "1.23.3"
}

variable "internal_port" {
  type        = number
  description = "The internal port number for the container"
}

variable "external_port" {
  type        = number
  description = "The external port number for the container"
}