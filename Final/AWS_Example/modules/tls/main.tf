resource "tls_private_key" "mykey" {
  algorithm = "RSA"
  rsa_bits  = 4096
}