resource "tls_private_key" "mykey" {
  algorithm = var.algorithm
  rsa_bits  = var.rsa_bits
}