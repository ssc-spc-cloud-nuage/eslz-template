terraform {
  required_version = ">= 0.12.1"
  backend "azurerm" {
    #storage_account_name = var.storage_account_name
    #container_name       = var.container_name
    #key                  = var.key
    #access_key           = var.access_key
  }
}

provider "azurerm" {
  version = ">=2.1.0"
  features {}
}

provider "azuread" {
  version = ">=0.8.0"
}