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
    azurecaf = {
      source  = "aztfmod/azurecaf"
      version = "~>0.4.3"
    }
    time = {
      source = "hashicorp/time"
    }
  }
  required_version = ">= 0.13"
  backend "azurerm" {}
}

provider "azurerm" {
  features {}
}
