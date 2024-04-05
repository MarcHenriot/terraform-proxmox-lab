locals {
}

resource "proxmox_virtual_environment_vm" "ha_proxy" {
  vm_id     = var.vm_id + 100
  name      = "ha-proxy"
  node_name = var.node_name

  cpu {
    cores = 1
  }

  memory {
    dedicated = 1024
  }

  initialization {
    datastore_id      = "local-lvm"
    user_data_file_id = proxmox_virtual_environment_file.ha_proxy.id

    ip_config {
      ipv4 {
        address = "192.168.2.169/32"
        gateway = "192.168.2.1"
        # address = "dhcp"
      }
    }
  }

  agent {
    enabled = true
  }

  scsi_hardware = "virtio-scsi-pci"

  network_device {
    bridge = "vmbr0"
    model  = "virtio"
  }

  disk {
    datastore_id = "nvme"
    file_id      = var.cloud_image_file_id
    interface    = "virtio0"
    iothread     = true
    discard      = "on"
    size         = 8
  }
}

data "template_file" "ha_proxy" {
  template = file("${path.module}/cloud-init/ha-proxy.yaml.tpl")
  vars = {
    vm_name_prefix = "ha-proxy"
    ssh_public_key = trimspace(tls_private_key.ssh_private_key.public_key_openssh)
    # backend_balance = <<-EOF
    #   %{for index, addr in local.k8s_control_plane_ips~}
    #   server k8s-cp-${index} ${addr}:6443 check
    #   %{endfor~}
    # EOF
  }
}

resource "proxmox_virtual_environment_file" "ha_proxy" {
  content_type = "snippets"
  datastore_id = "local"
  node_name    = "pve"

  source_raw {
    data      = data.template_file.ha_proxy.rendered
    file_name = "ha-proxy.yaml"
  }
}
