# module "ssh_key" {
#   source = "../../modules/ssh-key"

#   private_key_path = "${path.cwd}/ssh/id_rsa"
#   public_key_path  = "${path.cwd}/ssh/id_rsa.pub"
# }

# module "qemu_config" {
#   source = "../../modules/cloud-init"

#   file_name                = "halp.yaml"
#   predefined_template_name = "qemu-base"
#   predefined_template_vars = {
#     fqdn           = "halp"
#     ssh_public_key = module.ssh_key.public_key_openssh
#   }
# }


locals {
  talos_version = "v1.8.3"
}

resource "proxmox_virtual_environment_download_file" "cloud_img" {
  content_type = "iso"
  datastore_id = "local"
  node_name    = "pve"
  url          = data.talos_image_factory_urls.this.urls.iso
}

data "talos_image_factory_extensions_versions" "this" {
  talos_version = local.talos_version
  filters = {
    names = [
      "qemu-guest-agent",
      # "iscsi-tools",
      # "util-linux-tools",
    ]
  }
}

resource "talos_image_factory_schematic" "this" {
  schematic = yamlencode({
    customization = {
      extraKernelArgs = [
        "init_on_alloc=1",
        "slab_nomerge",
        "pti=on",
        "panic=0",
        "consoleblank=0",
        "printk.devkmsg=on",
        "earlyprintk=ttyS0",
        "console=tty0",
        "console=ttyS0",
        "talos.platform=metal",
        "ip=192.168.2.180::192.168.2.1:255.255.255.0::eth0:off"
      ]
      systemExtensions = {
        officialExtensions = data.talos_image_factory_extensions_versions.this.extensions_info[*].name
      }
    }
  })
}

data "talos_image_factory_urls" "this" {
  talos_version = local.talos_version
  schematic_id  = talos_image_factory_schematic.this.id
  platform      = "metal"
  architecture  = "amd64"
}

module "cp" {
  source = "../../modules/vm"

  vm_name = "cp01"
  vm_id   = "800"
  file_id = proxmox_virtual_environment_download_file.cloud_img.id

  ipv4_address = "192.168.2.180/24"
  ipv4_gateway = "192.168.2.1"

  tags = [
    "talos",
    "kubernetes",
    "controlplane",
  ]
}

# resource "talos_machine_secrets" "this" {
#   talos_version = local.talos_version
# }

# data "talos_client_configuration" "this" {
#   cluster_name         = "example-cluster"
#   client_configuration = talos_machine_secrets.this.client_configuration
#   nodes = [
#     local.machine_ip_0,
#   ]
# }

# resource "talos_cluster_kubeconfig" "this" {
#   client_configuration = talos_machine_secrets.this.client_configuration
#   endpoint             = local.machine_ip_0
#   node                 = local.machine_ip_0

#   depends_on = [
#     talos_machine_bootstrap.this
#   ]
# }

# data "talos_machine_configuration" "cp" {
#   cluster_name       = "example-cluster"
#   cluster_endpoint   = "https://${local.machine_ip_0}:6443"
#   machine_secrets    = talos_machine_secrets.this.machine_secrets
#   machine_type       = "controlplane"
#   talos_version      = local.talos_version
#   kubernetes_version = "1.31.2"
#   examples           = false
#   docs               = false
# }

# resource "talos_machine_configuration_apply" "cp" {
#   client_configuration        = talos_machine_secrets.this.client_configuration
#   machine_configuration_input = data.talos_machine_configuration.cp.machine_configuration
#   endpoint                    = local.machine_ip_0
#   node                        = local.machine_ip_0
#   config_patches = [
#     yamlencode({
#       machine = {
#         network = {
#           hostname = "halp-0"
#         }
#         install = {
#           disk = "/dev/vda"
#         }
#       }
#     }),
#   ]

#   depends_on = [
#     proxmox_virtual_environment_vm.this,
#   ]
# }

# resource "talos_machine_bootstrap" "this" {
#   client_configuration = talos_machine_secrets.this.client_configuration
#   endpoint             = local.machine_ip_0
#   node                 = local.machine_ip_0

#   depends_on = [
#     talos_machine_configuration_apply.cp
#   ]
# }

# resource "local_sensitive_file" "export_kubeconfig" {
#   depends_on = [talos_cluster_kubeconfig.this]
#   content    = talos_cluster_kubeconfig.this.kubeconfig_raw
#   filename   = "${path.cwd}/output/kubeconfig"
# }
