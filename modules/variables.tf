variable "region" {
  type        = string
  description = "Specifies the supported Azure location where the resource exists."
}
variable "storage_account_name" {
  type        = string
  description = "Specifies the name of the storage account"
}
variable "resource_group_name" {
  type        = string
  description = "The name of the resource group in which to create the storage account."
}
variable "tier" {
  type        = string
  description = "Defines the Tier to use for this storage account. Valid options are Standard and Premium."
}
variable "replication_type" {
  type        = string
  description = "Defines the type of replication to use for this storage account. Valid options are LRS, GRS, RAGRS, ZRS, GZRS and RAGZRS."
  default     = "LRS"
}

variable "network_rules" {
  description = "network_rules"
  type        = any
  default     = {}
}

variable "Tagschange" {
  type        = string
  description = "Tags"
}

# variable "vnet_id" {
#   type = string
# }

variable "subnet_name" {
  type = string
}

# variable "dns_zone_id" {
#   type = string
# }