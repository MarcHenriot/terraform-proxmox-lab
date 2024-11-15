resource "proxmox_virtual_environment_vm" "this" {
  name          = var.vm_name
  vm_id         = var.vm_id
  node_name     = var.node_name
  on_boot       = var.on_boot
  scsi_hardware = var.scsi_hardware
  tags          = sort(var.tags)
  bios          = var.bios
  machine       = var.machine

  operating_system {
    type = var.operating_system_type
  }

  agent {
    enabled = true
    trim    = true
  }

  vga {
    type = "qxl"
  }

  tpm_state {
    version = "v2.0"
  }

  cpu {
    type    = var.cpu_type
    cores   = var.cpu_cores
    sockets = var.cpu_sockets
  }

  memory {
    dedicated = var.memory_dedicated
  }

  initialization {
    ip_config {
      ipv4 {
        address = var.ipv4_address
        gateway = var.ipv4_gateway
      }
    }
  }

  network_device {
    enabled  = true
    firewall = false
    bridge   = var.network_device_bridge
    model    = var.network_device_type
  }

  disk {
    interface    = var.disk_interface
    size         = var.disk_size
    datastore_id = var.disk_datastore_id
    file_format  = var.disk_file_format
    backup       = false
    iothread     = true
    ssd          = true
    discard      = "on"
    file_id      = var.file_id
  }

  efi_disk {
    datastore_id = "local-lvm"
    file_format  = "raw"
    type         = "4m"
  }
}
