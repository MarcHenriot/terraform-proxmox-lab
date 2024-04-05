variable "mac_prefix" {
  type        = string
  description = "MAC prefix"
}

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

variable "email_from" {
  type        = string
  default     = "notset@todo.com"
  description = "email address to send notification"
}

variable "console" {
  type        = string
  default     = "xtermjs"
  description = "Console viewer"
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
