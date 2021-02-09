terraform {
  required_providers {
    azurerm = {
      # https://github.com/terraform-providers/terraform-provider-azurerm
      source  = "hashicorp/azurerm"
      version = "~> 2.46.1"
    }
    azuread = {
      # https://github.com/hashicorp/terraform-provider-azuread
      source  = "hashicorp/azuread"
      version = "~> 1.3.0"
    }
  }
  required_version = ">= 0.14"
  backend "azurerm" {}
}

provider "azurerm" {
  features {}
}
