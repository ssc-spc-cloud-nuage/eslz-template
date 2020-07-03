# Reading the L1 terraform state
/*
data "terraform_remote_state" "L1" {
  backend = "azurerm"
  config  = var.L1_terraform_remote_state_config
}
*/
data "terraform_remote_state" "L1" {
  backend = "azurerm"
  config = {
    storage_account_name = var.lowerlevel_storage_account_name
    container_name       = "sandpit"
    key                  = var.L1_terraform_remote_state_config.key
    resource_group_name  = var.lowerlevel_resource_group_name
  }
}

# Mapping needed outputs from L1 statefile to locals for easy access

locals {
  resource_groups_L1           = data.terraform_remote_state.L1.outputs.resource_groups_L1
  subnets                      = data.terraform_remote_state.L1.outputs.subnets
  Project-law                  = data.terraform_remote_state.L1.outputs.Project-law
  Project_law-sa               = data.terraform_remote_state.L1.outputs.Project_law-sa
  Project-kv                   = data.terraform_remote_state.L1.outputs.Project-kv
  L2_Subscription_Contributors = data.terraform_remote_state.L1.outputs.L2_Subscription_Contributors
  L2_Subscription_Readers      = data.terraform_remote_state.L1.outputs.L2_Subscription_Readers
}