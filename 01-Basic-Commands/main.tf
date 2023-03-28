terraform {
  required_providers {               # The `required_providers` block specifies the provider(s) needed for this Terraform configuration.
    docker = {                       # Here, we are requiring the `docker` provider.
      source  = "kreuzwerker/docker" # This line specifies the source of the provider. In this case, it is the `kreuzwerker/docker` provider.
      version = "3.0.1"              # This line specifies the version of the provider that we need.
    }
  }
}

provider "docker" {} # This `provider` block specifies that we want to use the `docker` provider.

resource "docker_image" "nginx_image" { # This `resource` block creates a Docker image named `nginx_image` using the `nginx:1.23.3` image.
  name = "nginx:1.23.3"
}

resource "docker_container" "nginx_container" { # This `resource` block creates a Docker container named `nginx_container` based on the `nginx_image` image.
  name  = "web-server"                          # This line specifies the name of the container.
  image = docker_image.nginx_image.image_id     # This line references the `nginx_image` resource created earlier to get the image ID.
  ports {                                       # This block specifies the ports to be exposed by the container.
    internal = 80                               # The container's internal port 80 will be exposed.
    external = 8080                             # The container's internal port 80 will be accessible on the host's port 8080.
  }
}
