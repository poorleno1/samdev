# Virtual network
resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  location            = var.region
  resource_group_name = var.resource_group_name
  address_space       = [var.vnet_address_space]
}

# Private subnet for storage account
resource "azurerm_subnet" "private_subnet" {
  name                 = var.subnet_names
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.address_prefixes]
  
  private_endpoint_network_policies_enabled = true
  private_link_service_network_policies_enabled = true

  service_endpoints = ["Microsoft.Storage"]
}


resource "azurerm_private_dns_zone" "adls" {
  name                = "privatelink.blob.core.windows.net"
  resource_group_name = var.resource_group_name
}

resource "azurerm_private_dns_zone_virtual_network_link" "reports" {
  name                  = "${var.private_endpoint_name}-dns-vnet-link"
  resource_group_name   = var.resource_group_name
  private_dns_zone_name = azurerm_private_dns_zone.adls.name
  virtual_network_id    = azurerm_virtual_network.vnet.id
}