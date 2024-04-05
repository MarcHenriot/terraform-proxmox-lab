variable "vm_id" {
  type        = number
  description = "The VM ID"
}

variable "vm_name_prefix" {
  type        = string
  description = "The VM name"
}

variable "cloud_image_file_id" {
  type        = string
  description = "The cloud image file ID"
}

variable "cp_count" {
  type        = number
  description = "Number of Kubernetes control plane nodes"
  default     = 3
}

variable "worker_count" {
  type        = number
  description = "Number of Kubernetes worker nodes"
  default     = 3
}

variable "node_name" {
  type        = string
  description = "The name of the PVE node tu create VM in"
  default     = "pve"
}

variable "cpu" {
  type        = number
  description = "The number of CPUs"
}

variable "memory" {
  type        = number
  description = "The amount of memory"
}

variable "root_password_length" {
  type        = number
  description = "The length of the root password"
  default     = 32
}
