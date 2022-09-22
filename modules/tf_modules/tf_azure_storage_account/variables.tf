variable "region" { 
    type = string 
    description = "Specifies the supported Azure location where the resource exists."
}
variable "storage_account_name"{ 
    type = string
    description = "Specifies the name of the storage account" 
}
variable "resource_group_name"{ 
    type = string 
    description = "The name of the resource group in which to create the storage account."
}
variable "tier"{ 
    type = string 
    description = "Defines the Tier to use for this storage account. Valid options are Standard and Premium."
}
variable "replication_type"{ 
    type = string
    description = "Defines the type of replication to use for this storage account. Valid options are LRS, GRS, RAGRS, ZRS, GZRS and RAGZRS."
    default = "LRS"
}
variable "cors" {
    description = "CORS rules"
    type    = map
    default     = {}
 }
variable "network_rules"{
    description = "network_rules"
    type    = any
    default     = {}
 }
variable "custom_domain"{
    description = "custom_domain"
    type    = map
    default     = {}
 }
variable "Tagschange"{ 
    type = string
    description = "Tags" 
}
variable "principal_ids"{ 
    type = list(string)
    description = "Principal ID" 
}


