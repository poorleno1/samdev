output "dns_zone_id" {
  value = azurerm_private_dns_zone.adls.id
}

output "subnet_id" {
  value = azurerm_subnet.private_subnet.id
}