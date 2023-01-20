variable "region" {
  type        = string
  description = "The AWS region"
  default     = "us-east-1"
}

variable "my_aws_key" {
  type        = string
  description = "AWS key to SSH into EC2 instances"
  default     = "mykey.pem"
}