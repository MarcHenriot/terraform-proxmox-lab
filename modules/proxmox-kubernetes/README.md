<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.7.0 |
| <a name="requirement_local"></a> [local](#requirement\_local) | 2.5.1 |
| <a name="requirement_proxmox"></a> [proxmox](#requirement\_proxmox) | 0.49.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | 3.6.0 |
| <a name="requirement_template"></a> [template](#requirement\_template) | 2.2.0 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | 4.0.5 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_local"></a> [local](#provider\_local) | 2.5.1 |
| <a name="provider_proxmox"></a> [proxmox](#provider\_proxmox) | 0.49.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.6.0 |
| <a name="provider_template"></a> [template](#provider\_template) | 2.2.0 |
| <a name="provider_tls"></a> [tls](#provider\_tls) | 4.0.5 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [local_sensitive_file.ssh_private_key](https://registry.terraform.io/providers/hashicorp/local/2.5.1/docs/resources/sensitive_file) | resource |
| [local_sensitive_file.ssh_public_key](https://registry.terraform.io/providers/hashicorp/local/2.5.1/docs/resources/sensitive_file) | resource |
| [proxmox_virtual_environment_file.cloud_config](https://registry.terraform.io/providers/bpg/proxmox/0.49.0/docs/resources/virtual_environment_file) | resource |
| [proxmox_virtual_environment_file.ha_proxy](https://registry.terraform.io/providers/bpg/proxmox/0.49.0/docs/resources/virtual_environment_file) | resource |
| [proxmox_virtual_environment_vm.ha_proxy](https://registry.terraform.io/providers/bpg/proxmox/0.49.0/docs/resources/virtual_environment_vm) | resource |
| [proxmox_virtual_environment_vm.this](https://registry.terraform.io/providers/bpg/proxmox/0.49.0/docs/resources/virtual_environment_vm) | resource |
| [random_bytes.kubeadm_certificate_key](https://registry.terraform.io/providers/hashicorp/random/3.6.0/docs/resources/bytes) | resource |
| [random_password.root](https://registry.terraform.io/providers/hashicorp/random/3.6.0/docs/resources/password) | resource |
| [random_string.token_id](https://registry.terraform.io/providers/hashicorp/random/3.6.0/docs/resources/string) | resource |
| [random_string.token_secret](https://registry.terraform.io/providers/hashicorp/random/3.6.0/docs/resources/string) | resource |
| [tls_private_key.ssh_private_key](https://registry.terraform.io/providers/hashicorp/tls/4.0.5/docs/resources/private_key) | resource |
| [template_file.cloud_config](https://registry.terraform.io/providers/hashicorp/template/2.2.0/docs/data-sources/file) | data source |
| [template_file.ha_proxy](https://registry.terraform.io/providers/hashicorp/template/2.2.0/docs/data-sources/file) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cloud_image_file_id"></a> [cloud\_image\_file\_id](#input\_cloud\_image\_file\_id) | The cloud image file ID | `string` | n/a | yes |
| <a name="input_cp_count"></a> [cp\_count](#input\_cp\_count) | Number of Kubernetes control plane nodes | `number` | `3` | no |
| <a name="input_cpu"></a> [cpu](#input\_cpu) | The number of CPUs | `number` | `2` | no |
| <a name="input_memory"></a> [memory](#input\_memory) | The amount of memory | `number` | `2048` | no |
| <a name="input_node_name"></a> [node\_name](#input\_node\_name) | The name of the PVE node tu create VM in | `string` | `"pve"` | no |
| <a name="input_root_password_length"></a> [root\_password\_length](#input\_root\_password\_length) | The length of the root password | `number` | `32` | no |
| <a name="input_vm_id"></a> [vm\_id](#input\_vm\_id) | The VM ID | `number` | `8000` | no |
| <a name="input_vm_name_prefix"></a> [vm\_name\_prefix](#input\_vm\_name\_prefix) | The VM name | `string` | `"k8s"` | no |
| <a name="input_worker_count"></a> [worker\_count](#input\_worker\_count) | Number of Kubernetes worker nodes | `number` | `3` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
