resource "azurerm_monitor_scheduled_query_rules_alert" "key_vault_changes" {
  enabled             = var.key_vault_changes_enabled
  name                = "Key vault was changed"
  location            = var.location
  resource_group_name = var.resource_group_name

  action {
    action_group = var.action_group_ids
  }

  data_source_id = var.log_analtyics_workspace_resource_id
  description    = <<-DESCRIPTION
  One or more of your key vaults has been changed. Investigate if this was a valid action!
  DESCRIPTION

  query = <<-QUERY
    AzureActivity
    | where CategoryValue == "Administrative"
    | where OperationNameValue startswith "MICROSOFT.KEYVAULT" and OperationNameValue endswith "WRITE"
    | extend ObjectId = tostring(Claims_d.["http://schemas.microsoft.com/identity/claims/objectidentifier"])
    | where _ResourceId has_any(${join(", ", [for s in var.included_scopes : format("%q", s)])})
    | where not(_ResourceId has_any(${join(", ", [for s in var.excluded_scopes : format("%q", s)])}))
    | where ObjectId !in (${join(", ", [for s in var.expected_identity_object_ids : format("%q", s)])})
    | project TimeGenerated, Caller, _ResourceId, OperationNameValue
  QUERY

  severity    = 2
  frequency   = 10
  time_window = 10

  trigger {
    operator  = "GreaterThan"
    threshold = 0
  }
  tags = var.tags
}

resource "azurerm_monitor_scheduled_query_rules_alert" "key_vault_deleted" {
  enabled             = var.key_vault_deleted_enabled
  name                = "Key vault was deleted"
  location            = var.location
  resource_group_name = var.resource_group_name

  action {
    action_group = var.action_group_ids
  }

  data_source_id = var.log_analtyics_workspace_resource_id
  description    = <<-DESCRIPTION
  One or more of your key vaults (or its child resources) has been deleted. Investigate if this was a valid action!
  DESCRIPTION

  query = <<-QUERY
    AzureActivity
    | where CategoryValue == "Administrative"
    | where OperationNameValue startswith "MICROSOFT.KEYVAULT" and OperationNameValue endswith "DELETE"
    | extend ObjectId = tostring(Claims_d.["http://schemas.microsoft.com/identity/claims/objectidentifier"])
    | where _ResourceId has_any(${join(", ", [for s in var.included_scopes : format("%q", s)])})
    | where not(_ResourceId has_any(${join(", ", [for s in var.excluded_scopes : format("%q", s)])}))
    | where ObjectId !in (${join(", ", [for s in var.expected_identity_object_ids : format("%q", s)])})
    | project TimeGenerated, Caller, _ResourceId, OperationNameValue
  QUERY

  severity    = 2
  frequency   = 10
  time_window = 10

  trigger {
    operator  = "GreaterThan"
    threshold = 0
  }
  tags = var.tags
}

resource "azurerm_monitor_scheduled_query_rules_alert" "key_vault_purged" {
  enabled             = var.key_vault_purged_enabled
  name                = "Key vault was purged"
  location            = var.location
  resource_group_name = var.resource_group_name

  action {
    action_group = var.action_group_ids
  }

  data_source_id = var.log_analtyics_workspace_resource_id
  description    = <<-DESCRIPTION
  One or more of your key vaults (or its child resources) has been purged. Investigate if this was a valid action!
  DESCRIPTION

  query = <<-QUERY
    AzureActivity
    | where CategoryValue == "Administrative"
    | where OperationNameValue startswith "MICROSOFT.KEYVAULT" and OperationNameValue endswith "PURGE/ACTION"
    | extend ObjectId = tostring(Claims_d.["http://schemas.microsoft.com/identity/claims/objectidentifier"])
    | where _ResourceId has_any(${join(", ", [for s in var.included_scopes : format("%q", s)])})
    | where not(_ResourceId has_any(${join(", ", [for s in var.excluded_scopes : format("%q", s)])}))
    | where ObjectId !in (${join(", ", [for s in var.expected_identity_object_ids : format("%q", s)])})
    | project TimeGenerated, Caller, _ResourceId, OperationNameValue
  QUERY

  severity    = 2
  frequency   = 10
  time_window = 10

  trigger {
    operator  = "GreaterThan"
    threshold = 0
  }
  tags = var.tags
}

resource "azurerm_monitor_scheduled_query_rules_alert" "key_vault_was_accessed" {
  enabled             = var.key_vault_was_accessed_enabled
  name                = "Key vault was accessed"
  location            = var.location
  resource_group_name = var.resource_group_name

  action {
    action_group = var.action_group_ids
  }

  data_source_id = var.log_analtyics_workspace_resource_id
  description    = <<-DESCRIPTION
  An unexpected identity has accessed your key vault. Investigate if this was a valid action!
  DESCRIPTION

  query = <<-QUERY
    AzureDiagnostics
    | where ResourceProvider == "MICROSOFT.KEYVAULT"
    | where ResultType == "Success"
    | where ResultSignature == "OK"
    | where _ResourceId has_any(${join(", ", [for s in var.included_scopes : format("%q", s)])})
    | where not(_ResourceId has_any(${join(", ", [for s in var.excluded_scopes : format("%q", s)])}))
    | where identity_claim_oid_g !in (${join(", ", [for s in var.expected_identity_object_ids : format("%q", s)])})
    | extend UserObjectId = iff(identity_claim_http_schemas_microsoft_com_identity_claims_objectidentifier_g == "",identity_claim_oid_g , identity_claim_http_schemas_microsoft_com_identity_claims_objectidentifier_g)
    | project TimeGenerated, ResourceId, OperationName, id_s, CallerIPAddress, clientInfo_s, identity_claim_appid_g, UserObjectId
  QUERY

  severity    = 2
  frequency   = 10
  time_window = 10

  trigger {
    operator  = "GreaterThan"
    threshold = 0
  }
  tags = var.tags
}

resource "azurerm_monitor_scheduled_query_rules_alert" "key_vault_was_accessed_from_unexpected_ip" {
  enabled             = var.key_vault_was_accessed_from_unexpected_ip_enabled
  name                = "Key vault was accessed from unexpected ip"
  location            = var.location
  resource_group_name = var.resource_group_name

  action {
    action_group = var.action_group_ids
  }

  data_source_id = var.log_analtyics_workspace_resource_id
  description    = <<-DESCRIPTION
  An unexpected identity has accessed your key vault. Investigate if this was a valid action!
  DESCRIPTION

  query = <<-QUERY
    AzureDiagnostics
    | where ResourceProvider == "MICROSOFT.KEYVAULT"
    | where ResultType == "Success"
    | where ResultSignature == "OK"
    | extend ipvalues = split(CallerIPAddress, ":")
    | extend ip = tostring(ipvalues[0])
    | where _ResourceId has_any(${join(", ", [for s in var.included_scopes : format("%q", s)])})
    | where not(_ResourceId has_any(${join(", ", [for s in var.excluded_scopes : format("%q", s)])}))
    | where not(${join(" or ", [for s in var.expected_subnets : format("ipv4_is_in_range( ip, %q)", s)])})
    | extend UserObjectId = iff(identity_claim_http_schemas_microsoft_com_identity_claims_objectidentifier_g == "",identity_claim_oid_g , identity_claim_http_schemas_microsoft_com_identity_claims_objectidentifier_g)
    | project TimeGenerated, ResourceId, OperationName, id_s, CallerIPAddress, clientInfo_s, identity_claim_appid_g, UserObjectId
  QUERY

  severity    = 2
  frequency   = 10
  time_window = 10

  trigger {
    operator  = "GreaterThan"
    threshold = 0
  }
  tags = var.tags
}