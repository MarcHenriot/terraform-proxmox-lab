
variable "language" {
  type        = string
  default     = "en"
  description = "GUI language"
}

variable "keyboard" {
  type        = string
  default     = "fr"
  description = "Keyboard layout"
}

variable "console" {
  type        = string
  default     = "xtermjs"
  description = "Console viewer"
}

variable "time_zone" {
  type        = string
  default     = "America/Montreal"
  description = "Time zone"
}

variable "kubernetes" {
  type = object({
    enabled        = bool
    vm_name_prefix = string
    vm_start_id    = number
    control_plane = object({
      count  = number
      cpu    = number
      memory = number
    })
    worker = object({
      count  = number
      cpu    = number
      memory = number
    })
  })
  description = "Kubernetes configuration"
}
