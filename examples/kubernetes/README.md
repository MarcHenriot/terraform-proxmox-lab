# Connect to Proxmox

```bash
touch auth.tf
```

## auth.tf

```hcl
provider "proxmox" {
  endpoint  = "https://xxx.xxx.xxx.xxx:8006/"
  api_token = "CHANGE_ME@CHANGE_ME"
  insecure  = true

  ssh {
    agent    = true
    username = "CHANGE_ME"
    password = "CHANGE_ME"
  }
}
```

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
| <a name="module_k8s"></a> [k8s](#module\_k8s) | ../../modules/proxmox-kubernetes | n/a |
| <a name="module_ubuntu_img"></a> [ubuntu\_img](#module\_ubuntu\_img) | ../../modules/proxmox-cloud-image | n/a |

## Resources

| Name | Type |
|------|------|
| [proxmox_virtual_environment_cluster_options.options](https://registry.terraform.io/providers/bpg/proxmox/0.51.1/docs/resources/virtual_environment_cluster_options) | resource |

## Inputs

No inputs.

## Outputs

No outputs.
<!-- END_TF_DOCS -->
