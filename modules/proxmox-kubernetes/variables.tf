variable "vm_id" {
  type        = number
  description = "The VM ID"
  default     = 8000
}

variable "vm_name_prefix" {
  type        = string
  description = "The VM name"
  default     = "k8s"
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

variable "cp_cpu" {
  type        = number
  description = "The number of CPUs for the controle plane"
  default     = 2
}

variable "cp_memory" {
  type        = number
  description = "The amount of memory for the controle plane"
  default     = 2048
}

variable "worker_cpu" {
  type        = number
  description = "The number of CPUs for the worker"
  default     = 2
}

variable "worker_memory" {
  type        = number
  description = "The amount of memory for the worker"
  default     = 2048
}

variable "root_password_length" {
  type        = number
  description = "The length of the root password"
  default     = 32
}
