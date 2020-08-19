terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.21.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 0.10.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 2.2.1"
    }
    null = {
      source  = "hashicorp/null"
      version = "~> 2.1.0"
    }
    azurecaf = {
      source  = "aztfmod/azurecaf"
      version = "~>0.4.3"
    }
  }
  required_version = ">= 0.13"
}


provider "azurerm" {
  features {}
}


data "azurerm_subscription" "primary" {}
data "azurerm_client_config" "current" {}


resource "random_string" "prefix" {
  length  = 4
  special = false
  upper   = false
  number  = false
}

resource "random_string" "alpha1" {
  length  = 1
  special = false
  upper   = false
  number  = false
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

  global_settings = {
    prefix           = local.prefix
    convention       = var.convention
    default_location = var.location
    environment      = var.environment
  }

  prefix             = "${var.env}-${var.group}_${var.project}"
  prefix_with_hyphen = local.prefix == "" ? "" : "${local.prefix}-"
  prefix_start_alpha = local.prefix == "" ? "" : "${random_string.alpha1.result}${local.prefix}"
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