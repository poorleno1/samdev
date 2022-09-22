 terraform {
   required_providers {
     azurerm = {
       source  = "hashicorp/azurerm"
       version = "~>2.0"
     }
   }
 }
 provider "azurerm" {
   features {}
 }

resource "random_password" "password" {
length = 16
special = true
override_special = "_%@"
}

resource "azurerm_sql_server" "sql-server" {
  name                         = var.server_name
  resource_group_name          = var.resource_group_name
  location                     = var.region
  version                      = var.version_number
  administrator_login          = var.admin_name
  administrator_login_password = random_password.password.result
  tags = {
    change = var.Tagschange
  }
 }

resource "azurerm_sql_firewall_rule" "example" {
  count = "${var.start_ip_address != "" && var.end_ip_address != "" ? 1 : 0}"
  name                = "office"
  resource_group_name = var.resource_group_name
  server_name         = azurerm_sql_server.sql-server.name
  start_ip_address    = var.start_ip_address
  end_ip_address      = var.end_ip_address
}
