variable "image_name" {
  type        = string
  description = "The name of the Docker image"
}

variable "image_tag" {
  type        = string
  description = "The tag of the Docker image"
}

variable "internal_port" {
  type        = number
  description = "The internal port number for the container"
  default     = 80
}

variable "external_port" {
  type        = number
  description = "The external port number for the container"
  default     = 8080
}