terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.21.0"
    }
  }
  required_version = ">= 0.13"
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
