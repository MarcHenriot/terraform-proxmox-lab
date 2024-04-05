locals {
  k8s_nodes_map = merge(
    {
      for idx in range(var.cp_count) : "cp-${idx}" => {
        worker  = false
        vm_id   = var.vm_id + idx
        name    = "${var.vm_name_prefix}-cp-${idx}"
        address = "192.168.2.${170 + idx}/32"
      }
    },
    {
      for idx in range(var.worker_count) : "worker-${idx}" => {
        worker  = true
        vm_id   = var.vm_id + idx + 10
        name    = "${var.vm_name_prefix}-worker-${idx}"
        address = "192.168.2.${180 + idx}/32"
      }
    }
  )
}

resource "local_sensitive_file" "ssh_private_key" {
  filename        = "${path.cwd}/ssh/id_rsa"
  content         = tls_private_key.ssh_private_key.private_key_pem
  file_permission = 400
}

resource "local_sensitive_file" "ssh_public_key" {
  filename        = "${path.cwd}/ssh/id_rsa.pub"
  content         = tls_private_key.ssh_private_key.public_key_openssh
  file_permission = 400
}

resource "tls_private_key" "ssh_private_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "random_password" "root" {
  length  = var.root_password_length
  special = false
}

resource "proxmox_virtual_environment_vm" "this" {
  for_each = local.k8s_nodes_map

  vm_id     = each.value.vm_id
  name      = each.value.name
  node_name = var.node_name

  cpu {
    cores = var.cpu
  }

  memory {
    dedicated = var.memory
  }

  initialization {
    datastore_id      = "local-lvm"
    user_data_file_id = proxmox_virtual_environment_file.cloud_config[each.key].id

    ip_config {
      ipv4 {
        address = each.value.address
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
    size         = 32
  }

  depends_on = [
    proxmox_virtual_environment_vm.ha_proxy
  ]
}

# Generate bootstrap token
# See https://kubernetes.io/docs/reference/access-authn-authz/bootstrap-tokens/
resource "random_string" "token_id" {
  length  = 6
  lower   = true
  numeric = true
  special = false
  upper   = false
}

resource "random_string" "token_secret" {
  length  = 16
  lower   = true
  numeric = true
  special = false
  upper   = false
}

# Hex encoded string that is an AES key of size 32 bytes.
resource "random_bytes" "kubeadm_certificate_key" {
  length = 32
}

data "template_file" "cloud_config" {
  for_each = local.k8s_nodes_map

  template = file("${path.module}/cloud-init/kubernetes/control-plane.yaml.tpl")
  vars = {
    fqdn                    = each.value.name
    index                   = each.key
    ssh_public_key          = trimspace(tls_private_key.ssh_private_key.public_key_openssh)
    kubeadm_cp_endpoit      = "192.168.2.169:6443"
    kubeadm_token           = "${random_string.token_id.result}.${random_string.token_secret.result}"
    kubeadm_certificate_key = random_bytes.kubeadm_certificate_key.hex
    # openssl x509 -pubkey -in /etc/kubernetes/pki/ca.crt | openssl rsa -pubin -outform der 2>/dev/null | openssl dgst -sha256 -hex
    kubeadm_discovery_token_ca_cert_hash = ""
    worker                               = each.value.worker
  }
}

resource "proxmox_virtual_environment_file" "cloud_config" {
  for_each = local.k8s_nodes_map

  content_type = "snippets"
  datastore_id = "local"
  node_name    = "pve"

  source_raw {
    data      = data.template_file.cloud_config[each.key].rendered
    file_name = "${each.value.name}.yaml"
  }
}
