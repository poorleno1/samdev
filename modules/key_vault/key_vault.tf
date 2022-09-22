#
# Azure Key Vault
#
data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "key_vault" {
  name                = var.key_vault_name
  resource_group_name = var.resource_group_name
  location            = var.region
  tenant_id           = data.azurerm_client_config.current.tenant_id
  sku_name            = "standard"

}

# 
# Access Policy
# 
resource "azurerm_key_vault_access_policy" "access_policy" {
  for_each     = { for policies in local.access_policy : policies.sl_no => policies }
  key_vault_id = azurerm_key_vault.key_vault.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = each.value.access_id

  storage_permissions = [
    "Get",
    "List",
    "Delete",
    "Update",
    "RegenerateKey",
    "GetSAS",
    "ListSAS",
    "DeleteSAS",
    "SetSAS",
    "Recover",
    "Backup",
    "Restore",
    "Purge"
  ]
}

#
# Secret for ECC Dataflow
#
resource "azurerm_key_vault_secret" "secret" {
  name         = var.secret_name
  value        = var.secret_value
  key_vault_id = azurerm_key_vault.key_vault.id
}
