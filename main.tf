data "proxmox_virtual_environment_nodes" "nodes" {}

resource "proxmox_virtual_environment_cluster_options" "options" {
  language = var.language
  keyboard = var.keyboard
  console  = var.console
}

resource "proxmox_virtual_environment_time" "node_time" {
  for_each = toset(data.proxmox_virtual_environment_nodes.nodes.names)

  node_name = each.value
  time_zone = var.time_zone
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
