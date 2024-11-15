data "template_file" "predefined" {
  template = file("${path.module}/cloud-init/${var.predefined_template_name}.yaml.tpl")
  vars     = var.predefined_template_vars
}

resource "proxmox_virtual_environment_file" "predefined" {
  content_type = var.content_type
  datastore_id = var.datastore_id
  node_name    = var.node_name

  source_raw {
    data      = data.template_file.predefined.rendered
    file_name = var.file_name
  }
}
