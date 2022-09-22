  storage_account_name     = "d3alf2tfstrnew"
  resource_group_name      = "d3alf2rg01"
  region                   = "West Europe"
  tier                     = "Standard"
  account_replication_type = "LRS"
  Tagschange               = "development"
  principal_ids            =  [
    "2ee77e9e-0cc4-4f78-bf83-978af29df1f3"
    #add principal id here
  ]
  network_rules            = [
      {
      "default_action" = "Deny"
      "ip_rules"     = ["91.228.255.36"] 
       "virtual_network_subnet_ids" = []
       "bypass" = ["AzureServices"]
    }  
    #add more ip blocks here 
   ]