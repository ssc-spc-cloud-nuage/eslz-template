terraform {
  required_version = ">= 0.12.1"
}

provider "azurerm" {
  version = ">= 2.1.0"
  features {}
}

provider "azuread" {
  version = ">=0.8.0"
}