variable "private_key_path" {
  type        = string
  description = "Path to store the private key"
}

variable "public_key_path" {
  type        = string
  description = "Path to store the public key"
}

variable "file_permission" {
  type        = string
  description = "Permission for the SSH private and public key"
  default     = "400"
}

variable "rsa_bits" {
  type        = number
  description = "RSA key size"
  default     = 4096
}
