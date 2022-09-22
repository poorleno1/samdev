output "azure_SQL_Server" {
   description = "The ID of the SQL Server"
   value       = azurerm_sql_server.sql-server.id
}
output "SQL_Server_password" {
   description = "The password for logging in to the database."
   value       = random_password.password.result
   sensitive   = true
}
