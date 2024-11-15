<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.7.0 |
| <a name="requirement_local"></a> [local](#requirement\_local) | >= 2.5.2 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | >= 4.0.6 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_local"></a> [local](#provider\_local) | >= 2.5.2 |
| <a name="provider_tls"></a> [tls](#provider\_tls) | >= 4.0.6 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [local_sensitive_file.ssh_private_key](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/sensitive_file) | resource |
| [local_sensitive_file.ssh_public_key](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/sensitive_file) | resource |
| [tls_private_key.ssh_private_key](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_file_permission"></a> [file\_permission](#input\_file\_permission) | Permission for the SSH private and public key | `string` | `"400"` | no |
| <a name="input_private_key_path"></a> [private\_key\_path](#input\_private\_key\_path) | Path to store the private key | `string` | n/a | yes |
| <a name="input_public_key_path"></a> [public\_key\_path](#input\_public\_key\_path) | Path to store the public key | `string` | n/a | yes |
| <a name="input_rsa_bits"></a> [rsa\_bits](#input\_rsa\_bits) | RSA key size | `number` | `4096` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_public_key_openssh"></a> [public\_key\_openssh](#output\_public\_key\_openssh) | The public key in OpenSSH format |
<!-- END_TF_DOCS -->