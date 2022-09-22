<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | =2.20.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | =2.20.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cors"></a> [cors](#input\_cors) | CORS rules | `map` | `{}` | no |
| <a name="input_custom_domain"></a> [custom\_domain](#input\_custom\_domain) | custom\_domain | `map` | `{}` | no |
| <a name="input_network_rules"></a> [network\_rules](#input\_network\_rules) | network\_rules | `map` | `{}` | no |
| <a name="input_region"></a> [region](#input\_region) | Specifies the supported Azure location where the resource exists. | `string` | n/a | yes |
| <a name="input_replication_type"></a> [replication\_type](#input\_replication\_type) | Defines the type of replication to use for this storage account. Valid options are LRS, GRS, RAGRS, ZRS, GZRS and RAGZRS. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which to create the storage account. | `string` | n/a | yes |
| <a name="input_storage_account_name"></a> [storage\_account\_name](#input\_storage\_account\_name) | Specifies the name of the storage account | `string` | n/a | yes |
| <a name="input_tier"></a> [tier](#input\_tier) | Defines the Tier to use for this storage account. Valid options are Standard and Premium. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_azure_storage_account"></a> [azure\_storage\_account](#output\_azure\_storage\_account) | The ID of the Storage account |
<!-- END_TF_DOCS -->