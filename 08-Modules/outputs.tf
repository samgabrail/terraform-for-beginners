output "public_ip" {
  value       = aws_instance.webserver.public_ip
  description = "EC2 Public IP"
}

output "private_key" {
  value     = module.tls.private_key_out
  sensitive = true
}