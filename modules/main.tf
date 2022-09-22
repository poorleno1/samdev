module "resource_group" {
  source              = "./resource_group"
  region              = var.region
  resource_group_name = var.resource_group_name
}

# module "resource_group_vnet" {
#   source              = "./resource_group"
#   region              = var.region
#   resource_group_name = var.resource_group_name_vnet
# }

module "vnet" {
  source                = "./vnet"
  vnet_name             = var.vnet_name
  resource_group_name   = module.resource_group.rg_name
  region                = var.region
  vnet_address_space    = var.vnet_address_space
  subnet_names          = var.subnet_name
  address_prefixes      = var.address_prefixes
  private_endpoint_name = "${var.storage_account_name}blobPEP01"
}

module "storage_account" {
  source               = "./storage_account"
  region               = var.region
  storage_account_name = var.storage_account_name
  resource_group_name  = module.resource_group.rg_name
  tier                 = var.tier
  replication_type     = var.replication_type
  network_rules        = var.network_rules
  Tagschange           = var.Tagschange
  #dns_zone_id          = var.dns_zone_id
  subnet_id            = module.vnet.subnet_id
  private_endpoint_name = "${var.storage_account_name}blobPEP01"
}

module "key_vault" {
  source              = "./key_vault"
  resource_group_name = module.resource_group.rg_name
  region              = var.region
  key_vault_name      = var.key_vault_name
  secret_name         = "${var.storage_account_name}key1"
  secret_value        = module.storage_account.access_key1
}
