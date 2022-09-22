output "azure_storage_account" {
  description = "The ID of the Storage account"
  value       = azurerm_storage_account.sa.id
}

output "access_key1" {
  description = "access key1"
  value       = azurerm_storage_account.sa.primary_access_key
}
