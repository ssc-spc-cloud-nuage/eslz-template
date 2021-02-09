terraform {
  required_providers {
    azurerm = {
      # https://github.com/terraform-providers/terraform-provider-azurerm
      source  = "hashicorp/azurerm"
      version = "~> 2.46.1"
    }
  }
  required_version = ">= 0.14"
}

provider "azurerm" {
  features {}
}

# Define variables used by profile
variable "env" {}
variable "group" {}
variable "project" {}

locals {
  landingzone_tag = {
    landingzone = var.launchpad_mode
  }
  tags = merge(var.tags, local.landingzone_tag, { "level" = var.level }, { "environment" = var.environment }, { "rover_version" = var.rover_version })
}
