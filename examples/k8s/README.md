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
