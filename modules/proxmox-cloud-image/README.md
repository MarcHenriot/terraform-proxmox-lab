<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.7.0 |
| <a name="requirement_proxmox"></a> [proxmox](#requirement\_proxmox) | 0.49.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_proxmox"></a> [proxmox](#provider\_proxmox) | 0.49.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [proxmox_virtual_environment_download_file.cloud_image](https://registry.terraform.io/providers/bpg/proxmox/0.49.0/docs/resources/virtual_environment_download_file) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_content_type"></a> [content\_type](#input\_content\_type) | Content type of the cloud image | `string` | `"iso"` | no |
| <a name="input_datastore_id"></a> [datastore\_id](#input\_datastore\_id) | Datastore ID for the cloud image | `string` | `"local"` | no |
| <a name="input_file_name"></a> [file\_name](#input\_file\_name) | File name of the cloud image | `string` | n/a | yes |
| <a name="input_node_name"></a> [node\_name](#input\_node\_name) | Node name for the cloud image | `string` | `"pve"` | no |
| <a name="input_url"></a> [url](#input\_url) | URL of the cloud image | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_file_id"></a> [file\_id](#output\_file\_id) | cloud image file file\_id |
<!-- END_TF_DOCS -->