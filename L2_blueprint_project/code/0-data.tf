data "azurerm_client_config" "current" {}

data "azurerm_dns_zone" "zone1" {
  name = "${var.domain.public.name}"
}

data azurerm_resource_group DNS-rg {
  name = "${local.prefix}_${var.project}_DNS-rg"
}

data azurerm_resource_group Keyvault-rg {
  name = "${local.prefix}_${var.project}_Keyvault-rg"
}

data azurerm_resource_group Logs-rg {
  name = "${local.prefix}_${var.project}_Logs-rg"
}

data azurerm_resource_group Management-rg {
  name = "${local.prefix}_${var.project}_Management-rg"
}

data azurerm_resource_group Network-rg {
  name = "${local.prefix}_${var.project}_Network-rg"
}

# Reading the L1 terraform state

data "terraform_remote_state" "L1" {
  backend = "azurerm"
  config  = var.L1_terraform_remote_state_config
}

# Mapping outputs from L1 statefile to locals for easy access

locals {
  Project_PAZ-snet = data.terraform_remote_state.L1.outputs.Project_PAZ-snet
  Project_OZ-snet  = data.terraform_remote_state.L1.outputs.Project_OZ-snet
  Project_RZ-snet  = data.terraform_remote_state.L1.outputs.Project_RZ-snet
  Project_MAZ-snet = data.terraform_remote_state.L1.outputs.Project_MAZ-snet
  Project-law      = data.terraform_remote_state.L1.outputs.Project-law
  Project_law-sa   = data.terraform_remote_state.L1.outputs.Project_law-sa
  Project-kv       = data.terraform_remote_state.L1.outputs.Project-kv
}