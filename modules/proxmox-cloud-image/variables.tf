variable "file_name" {
  type        = string
  description = "File name of the cloud image"
}

variable "url" {
  type        = string
  description = "URL of the cloud image"
}

variable "content_type" {
  type        = string
  description = "Content type of the cloud image"
  default     = "iso"
}

variable "datastore_id" {
  type        = string
  description = "Datastore ID for the cloud image"
  default     = "local"
}

variable "node_name" {
  type        = string
  description = "Node name for the cloud image"
  default     = "pve"
}
