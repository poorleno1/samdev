variable "location" {
  type        = string
  description = "Region of the alerts"
}

variable "resource_group_name" {
  type        = string
  description = "Resource group in which the alerts are deployed"
}

variable "action_group_ids" {
  type        = list(string)
  description = "list of action group resource ids, which are activated when the alerts triggers"
}

variable "log_analtyics_workspace_resource_id" {
  type        = string
  description = "Resource id of the source log analytics workspace"
}

variable "excluded_scopes" {
  type        = list(string)
  default     = ["donotexcludeanything"]
  description = "List of resource scopes of what not to alert on"
}

variable "included_scopes" {
  type        = list(string)
  default     = [""]
  description = "List of Resource scopes on which to alert. Default is everything in the log analytics workspace"
}

variable "expected_identity_object_ids" {
  type        = list(string)
  default     = [""]
  description = "List of objectids of identies to exclude from alerting."
}

variable "expected_subnets" {
  type        = list(string)
  default     = ["0.0.0.0/0"]
  description = "List of subnet ranges from which you expect communications. Default 0.0.0.0/0 (so everything)"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "tags"
}

variable "key_vault_changes_enabled" {
  type        = bool
  default     = true
  description = "Enable or disable alerts for key vault changes"
}

variable "key_vault_deleted_enabled" {
  type        = bool
  default     = true
  description = "Enable or disable alerts for key vault delete actions"
}

variable "key_vault_purged_enabled" {
  type        = bool
  default     = true
  description = "Enable or disable alerts for purge actions on key vault"
}

variable "key_vault_was_accessed_enabled" {
  type        = bool
  default     = true
  description = "Enable or disable alerts for when a key vault has been accessed by someone or something"
}

variable "key_vault_was_accessed_from_unexpected_ip_enabled" {
  type        = bool
  default     = true
  description = "Enable or disable alerts for when a key vault has been accessed from an unexpected IP"
}