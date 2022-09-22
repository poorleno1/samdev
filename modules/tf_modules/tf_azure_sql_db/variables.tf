variable "resource_group_name" {
  type        = string
  description = "Please provide a name for the resource group."
}
variable "server_name" {
  type        = string
  description = "Please provide a name for the Azure SQL Server."
}
variable "sql_db_name" {
  type        = string
  description = "Please provide a name for the Azure SQL Database."
}
# variable "sql_db_max_size_gb" {
#   type        = number
#   description = "Please provide an Integer value for the max size of the SQL Database to be created."
# }
variable "sql_db_sku_name" {
  type        = string
  description = "Please provide the SKU name for the Azure SQL Database tier. Can be obtained with \"az sql db list-editions -a -l <Azure Region> -o table\""
  default = "Basic"
}
# variable "sql_db_zone_redundant" {
#   type        = bool
#   description = "Please provide confirmation (true|false) that Azure SQL Database should be zone redundant."
#   default = "true"
# }
variable "Tagschange"{ 
    type = string
    description = "Tags" 
}
