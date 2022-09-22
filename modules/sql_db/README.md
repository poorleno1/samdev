## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 2.80.0 |

## Modules

No modules.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_Tagschange"></a> [Tagschange](#input\_Tagschange) | Carlsberg ticket that generated the request ( either ServiceNow or Jira) | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Please provide an Azure region for the resource group. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Please provide a name for the resource group. | `string` | n/a | yes |
| <a name="input_server_name"></a> [server\_name](#input\_server\_name) | Please provide a name for the Azure SQL Server. | `string` | n/a | yes |
| <a name="input_sql_db_max_size_gb"></a> [sql\_db\_max\_size\_gb](#input\_sql\_db\_max\_size\_gb) | Please provide an Integer value for the max size of the SQL Database to be created. | `number` | n/a | yes |
| <a name="input_sql_db_name"></a> [sql\_db\_name](#input\_sql\_db\_name) | Please provide a name for the Azure SQL Database. | `string` | n/a | yes |
| <a name="input_sql_db_sku_name"></a> [sql\_db\_sku\_name](#input\_sql\_db\_sku\_name) | Please provide the SKU name for the Azure SQL Database tier. Can be obtained with "az sql db list-editions -a -l <Azure Region> -o table" | `string` | n/a | yes |
| <a name="input_sql_db_zone_redundant"></a> [sql\_db\_zone\_redundant](#input\_sql\_db\_zone\_redundant) | Please provide confirmation (true\|false) that Azure SQL Database should be zone redundant. | `bool` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_azure_sql_db"></a> [azure\_sql\_db](#output\_azure\_sql\_db) | The ID of the SQL Server |
