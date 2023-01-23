output "private_key" {
  value     = tls_private_key.mykey.private_key_pem
  sensitive = true
}

output "public_key_out" {
  value = tls_private_key.mykey.public_key_openssh
}
