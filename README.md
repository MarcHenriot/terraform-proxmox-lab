# Proxmox Lab

Welcome to the Proxmox Lab repository! This module is designed to help you set up your lab environment on a Proxmox server with ease.

## Disclaimer

**Important Note:** This project is currently under active development and is subject to significant changes. It is **not suitable for use with critical or important data**. Use it at your own risk.

### What You Should Know

- The codebase may undergo frequent updates, bug fixes, and enhancements.
- Features, APIs, and behavior may change without prior notice.
- I recommend using this project for experimentation, learning, or non-critical purp

## Sub-Modules

### [Kubernetes](https://github.com/MarcHenriot/terraform-proxmox-lab/blob/main/modules/proxmox-kubernetes/README.md)

The Kubernetes sub-module enables you to create a highly available Kubernetes cluster complete with an HAProxy load balancer.

### [Cloud Images](https://github.com/MarcHenriot/terraform-proxmox-lab/blob/main/modules/proxmox-cloud-image/README.md)

The Cloud Images sub-module simplifies the process of downloading and storing cloud images directly to your Proxmox server.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.7.0 |
| <a name="requirement_proxmox"></a> [proxmox](#requirement\_proxmox) | 0.51.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_proxmox"></a> [proxmox](#provider\_proxmox) | 0.51.1 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_kubernetes"></a> [kubernetes](#module\_kubernetes) | ./modules/proxmox-kubernetes | n/a |

## Resources

| Name | Type |
|------|------|
| [proxmox_virtual_environment_cluster_options.options](https://registry.terraform.io/providers/bpg/proxmox/0.51.1/docs/resources/virtual_environment_cluster_options) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_console"></a> [console](#input\_console) | Console viewer | `string` | `"xtermjs"` | no |
| <a name="input_email_from"></a> [email\_from](#input\_email\_from) | email address to send notification | `string` | `"notset@todo.com"` | no |
| <a name="input_keyboard"></a> [keyboard](#input\_keyboard) | Keyboard layout | `string` | `"fr"` | no |
| <a name="input_kubernetes"></a> [kubernetes](#input\_kubernetes) | Kubernetes configuration | <pre>object({<br>    enabled        = bool<br>    vm_name_prefix = string<br>    vm_start_id    = number<br>    control_plane = object({<br>      count  = number<br>      cpu    = number<br>      memory = number<br>    })<br>    worker = object({<br>      count  = number<br>      cpu    = number<br>      memory = number<br>    })<br>  })</pre> | n/a | yes |
| <a name="input_language"></a> [language](#input\_language) | GUI language | `string` | `"en"` | no |
| <a name="input_mac_prefix"></a> [mac\_prefix](#input\_mac\_prefix) | MAC prefix | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
