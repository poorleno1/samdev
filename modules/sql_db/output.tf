output "azure_sql_db" {
   description = "The ID of the SQL Server"
   value       = azurerm_mssql_database.sql_db.id
}
