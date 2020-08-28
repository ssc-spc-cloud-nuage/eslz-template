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

module "L0_Launchpad" {
  source = "github.com/canada-ca-terraform-modules/terraform-azurerm-caf-l0-launchpad"
  launchpad_mode = var.launchpad_mode
  level = var.level
  convention = var.convention
  location = var.location
  prefix = var.prefix
  tf_name = var.tf_name
  resource_groups = var.resource_groups
  storage_account_name = var.storage_account_name
  keyvaults = var.keyvaults
  subscriptions = var.subscriptions
  aad_apps = var.aad_apps
  launchpad_key_names = var.launchpad_key_names
  custom_role_definitions = var.custom_role_definitions
  tags = var.tags
  rover_version = var.rover_version
  user_type = var.user_type
  logged_user_objectId = var.logged_user_objectId
  aad_users = var.aad_users
  aad_roles = var.aad_roles
  aad_api_permissions = var.aad_api_permissions
  github_projects = var.github_projects
  azure_devops = var.azure_devops
  environment = var.environment
  blueprint_networking = var.blueprint_networking
  diagnostics_settings = var.diagnostics_settings
  log_analytics = var.log_analytics
  networking = var.networking
  env = var.env
  group = var.group
  project = var.project
}