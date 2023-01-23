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
  name = "nginx:1.23.3"
}

resource "docker_container" "nginx_container" {
  name  = "web-server"
  image = docker_image.nginx_image.image_id
  ports {
    internal = 80
    external = 8080
  }
}
