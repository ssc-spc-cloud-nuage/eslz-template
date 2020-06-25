# Reading the L1 terraform state

data "terraform_remote_state" "L1" {
  backend = "azurerm"
  config  = var.L1_terraform_remote_state_config
}

# Mapping needed outputs from L1 statefile to locals for easy access

locals {
  Project_PAZ-snet = data.terraform_remote_state.L1.outputs.Project_PAZ-snet
  Project_OZ-snet  = data.terraform_remote_state.L1.outputs.Project_OZ-snet
  Project_RZ-snet  = data.terraform_remote_state.L1.outputs.Project_RZ-snet
  Project_MAZ-snet = data.terraform_remote_state.L1.outputs.Project_MAZ-snet
  Project-law      = data.terraform_remote_state.L1.outputs.Project-law
  Project_law-sa   = data.terraform_remote_state.L1.outputs.Project_law-sa
  Project-kv       = data.terraform_remote_state.L1.outputs.Project-kv
}