terraform {
  required_version = ">= 1.7.0"

  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "~> 0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "~> 4"
    }
    local = {
      source  = "hashicorp/local"
      version = "~> 2"
    }
    template = {
      source  = "hashicorp/template"
      version = "~> 2"
    }
    talos = {
      source  = "siderolabs/talos"
      version = "~> 0"
    }
  }
}
