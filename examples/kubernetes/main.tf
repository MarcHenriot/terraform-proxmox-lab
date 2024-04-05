module "proxmox_lab" {
  source = "../.."

  mac_prefix = "BC:24:11"

  kubernetes = {
    enabled = true

    vm_name_prefix = "k8s"
    vm_start_id    = 8000

    control_plane = {
      count  = 3
      cpu    = 2
      memory = 2048
    }

    worker = {
      count  = 3
      cpu    = 2
      memory = 2048
    }
  }
}
