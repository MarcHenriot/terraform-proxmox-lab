resource "proxmox_virtual_environment_cluster_options" "options" {
  language   = var.language
  keyboard   = var.keyboard
  email_from = var.email_from
  mac_prefix = var.mac_prefix
  console    = var.console
}

module "kubernetes" {
  count = var.kubernetes.enabled ? 1 : 0

  source = "./modules/proxmox-kubernetes"

  vm_name_prefix = var.kubernetes.vm_name_prefix
  vm_id          = var.kubernetes.vm_start_id

  cp_count  = var.kubernetes.control_plane.count
  cp_cpu    = var.kubernetes.control_plane.cpu
  cp_memory = var.kubernetes.control_plane.memory

  worker_count  = var.kubernetes.worker.count
  worker_cpu    = var.kubernetes.worker.cpu
  worker_memory = var.kubernetes.worker.memory
}
