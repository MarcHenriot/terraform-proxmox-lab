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

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_proxmox_lab"></a> [proxmox\_lab](#module\_proxmox\_lab) | ../.. | n/a |

## Resources

No resources.

## Inputs

No inputs.

## Outputs

No outputs.
<!-- END_TF_DOCS -->
