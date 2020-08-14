terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.19.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 0.11.0"
    }
  }
  required_version = ">= 0.13"
  backend "azurerm" {}
}

provider "azurerm" {
  features {}
}
