module "proxmox_lab" {
  source = "../.."

  kubernetes = {
    enabled = false

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
