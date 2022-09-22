terraform {
  required_providers {
    azurerm = {
        version         =   "=2.20.0"
    }
  }
  backend "azurerm" {}
}
provider "azurerm" {
    #version         =   "=2.20.0"
    features {}
}