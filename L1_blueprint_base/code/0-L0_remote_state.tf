data "terraform_remote_state" "launchpad" {
  backend = "azurerm"
  config = {
    storage_account_name = var.lowerlevel_storage_account_name
    container_name       = var.lowerlevel_container_name
    key                  = var.lowerlevel_key
    resource_group_name  = var.lowerlevel_resource_group_name
  }
}

locals {
  L0_keyvaults       = data.terraform_remote_state.launchpad.outputs.keyvaults
  L0_resource_groups = data.terraform_remote_state.launchpad.outputs.resource_groups
}
