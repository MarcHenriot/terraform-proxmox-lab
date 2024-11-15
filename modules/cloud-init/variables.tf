variable "predefined_template_name" {
  type        = string
  description = "Predefined template to use to generate cloud-init file"

  validation {
    error_message = "Value must be in [qemu-base]"
    condition = contains([
      "qemu-base"
    ], var.predefined_template_name)
  }
}

variable "predefined_template_vars" {
  type        = map(string)
  description = <<EOT
Configuration for the predefined templates. The keys in this map represent specific template variables for predefined templates such as "qemu-base".

For the "qemu-base" template, the following variables must be provided:
- fqdn (string): The fully qualified domain name (FQDN) to assign to the machine.
- ssh_public_key (string): The SSH public key to be injected into the machine's authorized keys, typically used for SSH access.

For example:
predefined_template_vars = {
  fqdn           = "example.com"
  ssh_public_key = "ssh-rsa AAAA..."
}
EOT
  default     = {}
}

variable "content_type" {
  type        = string
  description = "Proxmox content type"
  default     = "snippets"
}

variable "datastore_id" {
  type        = string
  description = "Proxmox datastore ID"
  default     = "local"
}

variable "node_name" {
  type        = string
  description = "Proxmox node name"
  default     = "pve"
}

variable "file_name" {
  type        = string
  description = "Name of the file to be created in Proxmox"
}

