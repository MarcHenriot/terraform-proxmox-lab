output "public_key_openssh" {
  description = "The public key in OpenSSH format"
  value       = trimspace(tls_private_key.ssh_private_key.public_key_openssh)
}
