provider "azurerm" {
    features {}
}
data "azurerm_sql_server" "sql_server" {
  name                         = var.server_name
  resource_group_name          = var.resource_group_name
}
resource "azurerm_mssql_database" "sql_db" {
  name           = var.sql_db_name
  server_id      = data.azurerm_sql_server.sql_server.id
#   max_size_gb    = var.sql_db_max_size_gb
  sku_name       = var.sql_db_sku_name
#   zone_redundant = var.sql_db_zone_redundant
  tags = {
    change = var.Tagschange
  }
}
