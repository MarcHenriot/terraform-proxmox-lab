<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.7.0 |
| <a name="requirement_local"></a> [local](#requirement\_local) | >= 2.5.2 |
| <a name="requirement_proxmox"></a> [proxmox](#requirement\_proxmox) | >= 0.66.3 |
| <a name="requirement_template"></a> [template](#requirement\_template) | >= 2.2.0 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | >= 4.0.6 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_proxmox"></a> [proxmox](#provider\_proxmox) | >= 0.66.3 |
| <a name="provider_template"></a> [template](#provider\_template) | >= 2.2.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [proxmox_virtual_environment_download_file.ubuntu_cloud_image](https://registry.terraform.io/providers/bpg/proxmox/latest/docs/resources/virtual_environment_download_file) | resource |
| [proxmox_virtual_environment_file.cloud_config](https://registry.terraform.io/providers/bpg/proxmox/latest/docs/resources/virtual_environment_file) | resource |
| [proxmox_virtual_environment_vm.this](https://registry.terraform.io/providers/bpg/proxmox/latest/docs/resources/virtual_environment_vm) | resource |
| [template_file.cloud_config](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |

## Inputs

No inputs.

## Outputs

No outputs.
<!-- END_TF_DOCS -->