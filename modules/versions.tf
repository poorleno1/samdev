terraform {
  required_providers {
    azurerm = {
        version         =   ">3.10.0"
    }
  }
  backend "azurerm" {
    storage_account_name = "tfstate166916541"
    # Choose a container that is relevant for deployment: standalone or shared-farms
    container_name       = "terraform"
    # Unique files name in container
    key                  = "sam.tfstate"
    resource_group_name  = "tfstate"
  }
}
provider "azurerm" {
    features {}
}
