storage_account_name     = "d3alf2tfstrnew13"
resource_group_name      = "d3alf2rg01new"
region                   = "westeurope"
tier                     = "Standard"
account_replication_type = "LRS"
Tagschange               = "development"
network_rules = [
  {
    default_action             = "Deny"
    ip_rules                   = ["78.11.214.169"]
    virtual_network_subnet_ids = []
    bypass                     = ["AzureServices"]
  }
]
resource_group_name_vnet = "AzureVnet"
vnet_name = "NNANPSpoke-frdap-dt"
private_endpoint_subnet_name = "dt-alf2-PEP01"
key_vault_name = "dalf2kv02"
subnet_name = "dt-alf2-PEP"
vnet_address_space = "10.10.0.0/16"
address_prefixes = "10.10.1.0/24"
#vnet_id = "/subscriptions/d6c81d59-1777-431e-998d-2cd3788cb0a4/resourceGroups/AzureVnet/providers/Microsoft.Network/virtualNetworks/NNANPSpoke-frdap-dt"
#dns_zone_id = "/subscriptions/d6c81d59-1777-431e-998d-2cd3788cb0a4/resourceGroups/azurevnet/providers/Microsoft.Network/privateDnsZones/privatelink.blob.core.windows.net"
