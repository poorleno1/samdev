## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 2.20.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.1.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_sql_firewall_rule.example](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/sql_firewall_rule) | resource |
| [azurerm_sql_server.sql-server](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/sql_server) | resource |
| [random_password.password](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin_name"></a> [admin\_name](#input\_admin\_name) | Specifies the Administrator Name for SQL server | `string` | n/a | yes |
| <a name="input_end_ip_address"></a> [end\_ip\_address](#input\_end\_ip\_address) | The End IP Address for the firewall rule | `string` | `""` | no |
| <a name="input_region"></a> [region](#input\_region) | Specifies the supported Azure location where the resource exists. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Name of the resource group in which to sql server needs to be created | `string` | n/a | yes |
| <a name="input_servername"></a> [servername](#input\_servername) | Specifies the name of SQL Server | `string` | n/a | yes |
| <a name="input_start_ip_address"></a> [start\_ip\_address](#input\_start\_ip\_address) | The Start IP address for the firewall rule | `string` | `""` | no |
| <a name="input_version_number"></a> [version\_number](#input\_version\_number) | Specifies the version number for SQL server | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_azure_SQL_Server"></a> [azure\_SQL\_Server](#output\_azure\_SQL\_Server) | The ID of the SQL Server |
