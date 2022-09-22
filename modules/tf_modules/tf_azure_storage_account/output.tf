output "azure_storage_account" {
   description = "The ID of the Storage account"
   value       = azurerm_storage_account.sa.id
}