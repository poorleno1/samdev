# Submodule: Alerts
This module will deploy some basic alerts for key vault:
- One or more Key Vaults, or their child resources has been changed/created (Log Source: AzureActivityLog).
- One or more Key Vaults, or their child resources has been deleted (Log Source: AzureActivityLog).
- One or more Key Vaults, or their child resources has been purged (Log Source: AzureActivityLog).
- One or more Key Vaults has been accessed by someone or something (Log Source: AzureDiagnostics).
- One or more Key Vaults has been accessed from an IP that was not expected (Log Source: AzureDiagnostics).

Note that in order for the alerts to work you need the log source mentioned above in your Log Analytics Workspace.

The scope of the alerts can be influenced using `included_scopes` and `excluded_scopes`. By default the alerts will be applied on all the key vaults that are logging to the specified log analytics workspace. However if you only want to alert on a subset of key vaults or you need to different settings for different key vaults, you can change the scope. So for instance you can only alert on the key vaults for a specific subscription (included_scopes = ["/subscriptions/`sub_id`]"), but exclude a particular resource group from that subscription (excluded_scopes = ["/subscriptions/`sub_id`/resourceGroups/`excluded_resource_group`]).

As per default alerts will be triggered by any identity. Since you probably have some application that accesses the key vault regularly as part of an application stack, you can add the object id of that application to `expected_identity_object_ids`.

In order to set the expected subnets, for the unexpected subnet connected alert, you can set `expected_subnets`. Can either be a subnet (e.g. 10.160.64.0/24) or a single ip. Also works with public ip spaces.

Every alert can be turned off individually.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.10 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >=3.2.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >=3.2.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_action_group_ids"></a> [action\_group\_ids](#input\_action\_group\_ids) | list of action group resource ids, which are activated when the alerts triggers | `list(string)` | n/a | yes |
| <a name="input_excluded_scopes"></a> [excluded\_scopes](#input\_excluded\_scopes) | List of resource scopes of what not to alert on | `list(string)` | <pre>[<br>  "donotexcludeanything"<br>]</pre> | no |
| <a name="input_expected_identity_object_ids"></a> [expected\_identity\_object\_ids](#input\_expected\_identity\_object\_ids) | List of objectids of identies to exclude from alerting. | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| <a name="input_expected_subnets"></a> [expected\_subnets](#input\_expected\_subnets) | List of subnet ranges from which you expect communications. Default 0.0.0.0/0 (so everything) | `list(string)` | <pre>[<br>  "0.0.0.0/0"<br>]</pre> | no |
| <a name="input_included_scopes"></a> [included\_scopes](#input\_included\_scopes) | List of Resource scopes on which to alert. Default is everything in the log analytics workspace | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| <a name="input_key_vault_changes_enabled"></a> [key\_vault\_changes\_enabled](#input\_key\_vault\_changes\_enabled) | Enable or disable alerts for key vault changes | `bool` | `true` | no |
| <a name="input_key_vault_deleted_enabled"></a> [key\_vault\_deleted\_enabled](#input\_key\_vault\_deleted\_enabled) | Enable or disable alerts for key vault delete actions | `bool` | `true` | no |
| <a name="input_key_vault_purged_enabled"></a> [key\_vault\_purged\_enabled](#input\_key\_vault\_purged\_enabled) | Enable or disable alerts for purge actions on key vault | `bool` | `true` | no |
| <a name="input_key_vault_was_accessed_enabled"></a> [key\_vault\_was\_accessed\_enabled](#input\_key\_vault\_was\_accessed\_enabled) | Enable or disable alerts for when a key vault has been accessed by someone or something | `bool` | `true` | no |
| <a name="input_key_vault_was_accessed_from_unexpected_ip_enabled"></a> [key\_vault\_was\_accessed\_from\_unexpected\_ip\_enabled](#input\_key\_vault\_was\_accessed\_from\_unexpected\_ip\_enabled) | Enable or disable alerts for when a key vault has been accessed from an unexpected IP | `bool` | `true` | no |
| <a name="input_location"></a> [location](#input\_location) | Region of the alerts | `string` | n/a | yes |
| <a name="input_log_analtyics_workspace_resource_id"></a> [log\_analtyics\_workspace\_resource\_id](#input\_log\_analtyics\_workspace\_resource\_id) | Resource id of the source log analytics workspace | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Resource group in which the alerts are deployed | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | tags | `map(string)` | `{}` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->