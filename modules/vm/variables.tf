variable "vm_name" {
  description = "Name of the VM"
  type        = string
}

variable "vm_id" {
  description = "ID of the VM"
  type        = string
}

variable "node_name" {
  description = "Name of the Proxmox node"
  type        = string
  default     = "pve"
}

variable "tags" {
  description = "Tags for the VM"
  type        = list(string)
  default     = []
}

variable "on_boot" {
  description = "Specifies whether a VM will be started during system boot"
  type        = bool
  default     = true
}

variable "bios" {
  description = "BIOS type"
  type        = string
  default     = "ovmf"
}

variable "machine" {
  description = "The VM machine type"
  type        = string
  default     = "q35"
}

variable "scsi_hardware" {
  description = "SCSI hardware type"
  type        = string
  default     = "virtio-scsi-pci"
}

variable "operating_system_type" {
  description = "Operating system type"
  type        = string
  default     = "l26"
}

variable "memory_dedicated" {
  description = "Dedicated memory for the VM in MB"
  type        = number
  default     = 2024
}

variable "cpu_cores" {
  description = "Number of CPU cores"
  type        = number
  default     = 2
}

variable "cpu_sockets" {
  description = "Number of CPU sockets"
  type        = number
  default     = 1
}

variable "cpu_type" {
  description = "CPU type"
  type        = string
  default     = "host"
}

variable "disk_size" {
  description = "Disk size in GB"
  type        = number
  default     = 32
}

variable "disk_datastore_id" {
  description = "Datastore ID for disk"
  type        = string
  default     = "nvme"
}

variable "disk_interface" {
  description = "Disk interface"
  type        = string
  default     = "virtio0"
}

variable "disk_file_format" {
  description = "Disk file format"
  type        = string
  default     = "raw"
}

variable "file_id" {
  description = "File ID for the CD-ROM"
  type        = string
}

variable "ipv4_address" {
  description = "IPv4 address for initialization"
  type        = string
  default     = "dhcp"
}

variable "ipv4_gateway" {
  description = "IPv4 gateway for initialization"
  type        = string
  default     = ""
}

variable "network_device_bridge" {
  description = "Bridge for network device"
  type        = string
  default     = "vmbr0"
}

variable "network_device_type" {
  description = "Network device type"
  type        = string
  default     = "virtio"
}
