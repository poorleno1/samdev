variable "server_name"{ 
    type = string
    description = "Specifies the name of SQL Server"
 }
variable "resource_group_name"{ 
    type = string
    description = "Name of the resource group in which to sql server needs to be created"
 }
variable "region"{ 
    type = string
    description = "Specifies the supported Azure location where the resource exists."
 }
variable "admin_name"{ 
    type = string
    description = "Specifies the Administrator Name for SQL server"
    default = "sqladmin"
 }
variable "version_number" { 
    type = string 
    description = "Specifies the version number for SQL server"
    default = "12.0"
}

variable "start_ip_address" {
  default = ""
  description = "The Start IP address for the firewall rule"
}
variable "end_ip_address" {
  default = ""
  description = " The End IP Address for the firewall rule"
}
variable "Tagschange"{ 
    type = string
    description = "Tags" 
}
