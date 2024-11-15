resource "local_sensitive_file" "ssh_private_key" {
  filename        = var.private_key_path
  content         = tls_private_key.ssh_private_key.private_key_pem
  file_permission = var.file_permission
}

resource "local_sensitive_file" "ssh_public_key" {
  filename        = var.public_key_path
  content         = tls_private_key.ssh_private_key.public_key_openssh
  file_permission = var.file_permission
}

resource "tls_private_key" "ssh_private_key" {
  algorithm = "RSA"
  rsa_bits  = var.rsa_bits
}
