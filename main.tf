# resource "proxmox_virtual_environment_cluster_options" "options" {
#   language   = "en"
#   keyboard   = "fr"
#   email_from = "notset@todo.com"
#   mac_prefix = "BC:24:11"
#   console    = "xtermjs"
# }

# module "ubuntu_img" {
#   source = "./modules/proxmox-cloud-image"

#   file_name = "jammy-server-cloudimg-amd64.img"
#   url       = "https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64.img"
# }

# module "k8s_cp" {
#   source = "./modules/proxmox-vm"

#   vm_count       = 3
#   vm_id          = 8000
#   vm_name_prefix = "k8s-cp"

#   cpu    = 2
#   memory = 2048

#   cloud_image_file_id = module.ubuntu_img.file_id
# }