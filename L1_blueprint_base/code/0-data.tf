data "azurerm_client_config" "current" {}

data "azurerm_subscription" "primary" {}

data "azuread_users" "L1_Subscription_Owners" {
  user_principal_names = var.L1_RBAC.ownerNames
}

data "azuread_users" "L1_Subscription_Contributors" {
  user_principal_names = var.L1_RBAC.contributorNames
}

data "azuread_users" "L1_Subscription_Readers" {
  user_principal_names = var.L1_RBAC.readerNames
}

data "terraform_remote_state" "launchpad" {
  backend = "azurerm"
  config = {
    storage_account_name  = var.lowerlevel_storage_account_name
    container_name        = var.lowerlevel_container_name
    key                   = var.lowerlevel_key
    resource_group_name   = var.lowerlevel_resource_group_name
  }
}

locals {
  L0_keyvault = data.terraform_remote_state.launchpad.outputs.keyvaults.launchpad
  #L0_storageaccount = data.terraform_remote_state.launchpad.outputs.
}
