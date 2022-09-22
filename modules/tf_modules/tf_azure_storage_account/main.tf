resource "azurerm_storage_account" "sa" {
  name                     = "${var.storage_account_name}"
  resource_group_name      = var.resource_group_name
  location                 = var.region
  account_tier             = var.tier
  account_replication_type = var.replication_type
  account_kind             = "StorageV2"
  access_tier              = "Hot"
  enable_https_traffic_only = "true"
  allow_blob_public_access = "false"
  tags = {
    change = var.Tagschange
  }
  blob_properties {
    dynamic "cors_rule" {
        for_each = length(keys(var.cors)) == 0 ? [] : [var.cors]
        content {
        allowed_origins    = lookup(cors.value, "allowed_origins", null)
        allowed_methods    = lookup(cors.value, "allowed_methods", null)
        allowed_headers    = lookup(cors.value, "allowed_headers", null)
        exposed_headers    = lookup(cors.value, "exposed_headers", null)
        max_age_in_seconds = lookup(cors.value, "max_age_in_seconds", null)
    }
  }
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
   dynamic "custom_domain" {
    for_each = length(keys(var.custom_domain)) == 0 ? [] : [var.custom_domain]

    content {
      name          = lookup(custom_domain.value, "name", null)
      use_subdomain = lookup(custom_domain.value, "use_subdomain", null)
    }
  }
}
    data "azurerm_subscription" "primary" {}
      
    #resource "azurerm_role_assignment" "role_assignment" {
      #for_each = toset(var.principal_ids)
      #scope = data.azurerm_subscription.primary.id
      #role_definition_name = "Storage Blob Data Contributor"
      #principal_id = each.key
    #}