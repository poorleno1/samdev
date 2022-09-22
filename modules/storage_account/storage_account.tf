
resource "azurerm_storage_account" "sa" {
  name                      = var.storage_account_name
  resource_group_name       = var.resource_group_name
  location                  = var.region
  account_tier              = var.tier
  account_replication_type  = var.replication_type
  account_kind              = "StorageV2"
  access_tier               = "Hot"
  enable_https_traffic_only = "true"
  is_hns_enabled            = true
  # large_file_share_enabled = false
  tags = {
    change = var.Tagschange
  }

  dynamic "network_rules" {
    for_each = var.network_rules
    content {
      default_action             = network_rules.value.default_action
      ip_rules                   = network_rules.value.ip_rules
      virtual_network_subnet_ids = network_rules.value.virtual_network_subnet_ids
      bypass                     = network_rules.value.bypass
    }
  }
  

}

resource "azurerm_storage_data_lake_gen2_filesystem" "adls_filesystem" {
  for_each           = { for containers in local.data_lake_containers : containers.container => containers }
  storage_account_id = azurerm_storage_account.sa.id
  name               = each.value.container

  dynamic "ace" {
    for_each = local.data_lake_ace_settings
    content {
      scope       = ace.value.ace_scope
      type        = ace.value.ace_type
      id          = ace.value.ace_type == "other" || ace.value.ace_type == "mask" ? null : each.value.application_id
      permissions = ace.value.ace_permissions
    }
  }
  depends_on = [
    azurerm_role_assignment.role_assignment
  ]
}

resource "azurerm_storage_data_lake_gen2_path" "adls_path_folder1" {
  for_each           = { for containers in local.data_lake_containers : containers.container => containers }
  storage_account_id = azurerm_storage_account.sa.id
  path               = each.value.folder1 # for inbound folder
  filesystem_name    = azurerm_storage_data_lake_gen2_filesystem.adls_filesystem[each.value.container].name
  resource           = "directory"
  depends_on = [
    azurerm_storage_data_lake_gen2_filesystem.adls_filesystem
  ]
}

resource "azurerm_storage_data_lake_gen2_path" "adls_path_folder2" {
  for_each           = { for containers in local.data_lake_containers : containers.container => containers }
  storage_account_id = azurerm_storage_account.sa.id
  path               = each.value.folder2 # for outbound folder
  filesystem_name    = azurerm_storage_data_lake_gen2_filesystem.adls_filesystem[each.value.container].name
  resource           = "directory"
  depends_on = [
    azurerm_storage_data_lake_gen2_filesystem.adls_filesystem
  ]
}

# 
# Role Assignment
# 

resource "azurerm_role_assignment" "role_assignment" {
  for_each             = { for roles in local.role_assignments : roles.role => roles }
  scope                = azurerm_storage_account.sa.id
  principal_id         = each.value.object_id
  role_definition_name = each.value.role
  depends_on = [
    azurerm_storage_account.sa
  ]
}

# Private endpoint and private DNS
resource "azurerm_private_endpoint" "private_endpoint" {
  name                = var.private_endpoint_name
  location            = var.region
  resource_group_name = var.resource_group_name
  subnet_id           = var.subnet_id

  private_service_connection {
    name                           = "${var.storage_account_name}blobPLSC01"
    private_connection_resource_id = azurerm_storage_account.sa.id
    subresource_names              = ["blob"]
    is_manual_connection           = false
  }

  # private_dns_zone_group {
  #   name                 = "private-dns-zone-group"
  #   private_dns_zone_ids = [var.dns_zone_id]
  # }
}
