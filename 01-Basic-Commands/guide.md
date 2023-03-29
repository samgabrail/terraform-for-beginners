# Basic Commands

In this lab we learn the very basic Terraform commands.

## Instructions

1. Change directory into the 01-Basic-Commands directory:

```bash
cd 01-Basic-Commands
```

2. Run the following commands

```bash
terraform version
terraform -help
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
terraform output
```

Here is the explanation of each of these commands:
- `terraform version:` This command displays the currently installed version of Terraform. It is used to verify which version of Terraform you have installed and to ensure that the correct version is being used for your infrastructure.

- `terraform -help:` This command displays a list of available commands and options for Terraform. It is used to get help with Terraform commands and options and to learn how to use Terraform.

- `terraform init:` This command initializes a new or existing Terraform working directory. It is used to download and install the required provider plugins, configure the backend, and prepare the working directory for Terraform operations.

- `terraform fmt:` This command is used to format the Terraform configuration files in a standard and consistent way. It is used to automatically update and standardize the formatting of your Terraform code to make it easier to read and maintain.

- `terraform validate:` This command is used to validate the syntax and configuration of your Terraform code. It is used to check if your code follows the correct syntax and format and can catch errors early in the development process.

- `terraform plan:` This command generates an execution plan that shows what Terraform will do when you apply your configuration. It is used to preview the changes that will be made to your infrastructure and to detect any potential problems before applying the changes.

- `terraform apply:` This command applies the changes to your infrastructure according to your Terraform configuration. It is used to create, modify, or delete resources in your infrastructure.

- `terraform output:` This command displays the outputs of your Terraform configuration. It is used to retrieve the values of any output variables that were defined in your Terraform code.

3. Run `docker ps` and `docker images` to check the newly created container

```bash
docker ps
docker images
```

4. Go to the nginx URL
If port 8080 doesn't get forwarded automatically, then go to the `PORTS` tab and add port 8080 manually.

Now click on the Globe Icon under Lcal Address in the `PORTS` tab to open the URL for nginx.

5. Now destroy the environment with `terraform destroy`

```bash
terraform destroy
```

> Congratulations you have finished this lab!

## Lab Code Explanation

Terraform is an infrastructure-as-code tool that allows you to define and manage infrastructure resources in a declarative way. This Terraform configuration sets up a Docker container running the Nginx web server with port forwarding from port 8080 on the host machine to port 80 inside the container.


Let's go through the code line by line:

```hcl
terraform {
  required_providers {          # The `required_providers` block specifies the provider(s) needed for this Terraform configuration.
    docker = {                  # Here, we are requiring the `docker` provider.
      source  = "kreuzwerker/docker"   # This line specifies the source of the provider. In this case, it is the `kreuzwerker/docker` provider.
      version = "3.0.1"                # This line specifies the version of the provider that we need.
    }
  }
}

provider "docker" {}           # This `provider` block specifies that we want to use the `docker` provider.

resource "docker_image" "nginx_image" {    # This `resource` block creates a Docker image named `nginx_image` using the `nginx:1.23.3` image.
  name = "nginx:1.23.3"
}

resource "docker_container" "nginx_container" {  # This `resource` block creates a Docker container named `nginx_container` based on the `nginx_image` image.
  name  = "web-server"                         # This line specifies the name of the container.
  image = docker_image.nginx_image.image_id     # This line references the `nginx_image` resource created earlier to get the image ID.
  ports {                                       # This block specifies the ports to be exposed by the container.
    internal = 80                               # The container's internal port 80 will be exposed.
    external = 8080                             # The container's internal port 80 will be accessible on the host's port 8080.
  }
}
```
