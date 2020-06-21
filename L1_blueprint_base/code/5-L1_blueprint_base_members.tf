# This terraform file will add contributors to the subscription. Any user that will need to deploy using
# CAF need to be a member of this group. Alos, this group will be made member if the L0_blueprint_launchpad
# AAD Security group such that they can access the launchpad to get to the base and work on projects ;-)
#
# This last part still need to be figured out as we need to obtain programmatically the AAD Security Group object id
# created to add the L1_Subscription_Contributors to it.

/*
variable "workspace" {}
variable "lowerlevel_storage_account_name" {}
variable "lowerlevel_container_name" {}
variable "lowerlevel_key" {}                  # Keeping the key for the lower level0 access
variable "lowerlevel_resource_group_name" {}

data "terraform_remote_state" "landingzone_caf_foundations" {
  backend = "azurerm"
  config = {
    storage_account_name  = var.lowerlevel_storage_account_name
    container_name        = var.workspace
    key                   = "landingzone_caf_foundations.tfstate"
    resource_group_name   = var.lowerlevel_resource_group_name
  }
}

locals {  
    L0_prefix                      = data.terraform_remote_state.landingzone_caf_foundations.outputs.prefix
    L0_caf_foundations_accounting  = data.terraform_remote_state.landingzone_caf_foundations.outputs.blueprint_foundations_accounting 
    L0_caf_foundations_security    = data.terraform_remote_state.landingzone_caf_foundations.outputs.blueprint_foundations_security
    L0_global_settings             = data.terraform_remote_state.landingzone_caf_foundations.outputs.global_settings 
}
*/

data "azuread_group" "L1_Subscription_Contributors" {
  name = "${local.prefix}_${var.project}_L1_Subscription_Contributors"
}

data "azuread_users" "L1_Subscription_Contributors" {
  user_principal_names = var.L1_RBAC.contributorNames
}

resource "azuread_group_member" "L1_Subscription_Contributors-Members" {
  for_each = toset(data.azuread_users.L1_Subscription_Contributors.object_ids)

  group_object_id  = data.azuread_group.L1_Subscription_Contributors.id
  member_object_id = each.key
}

data "azuread_group" "L1_Subscription_Readers" {
  name = "${local.prefix}_${var.project}_L1_Subscription_Readers"
}

data "azuread_users" "L1_Subscription_Readers" {
  user_principal_names = var.L1_RBAC.readerNames
}

resource "azuread_group_member" "L1_Subscription_Readers-Members" {
  for_each = toset(data.azuread_users.L1_Subscription_Readers.object_ids)

  group_object_id  = data.azuread_group.L1_Subscription_Readers.id
  member_object_id = each.key
}