output "public_ip" {
  value       = aws_instance.webserver.public_ip
  description = "EC2 Public IP"
}