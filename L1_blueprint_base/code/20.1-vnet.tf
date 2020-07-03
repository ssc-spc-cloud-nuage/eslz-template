module Project-vnet {
  source            = "github.com/canada-ca-terraform-modules/terraform-azurerm-caf-virtual_network?ref=v1.0.0"
  env               = var.env
  userDefinedString = "${var.group}_${var.project}"
  resource_group    = local.resource_groups_L1.Network
  address_space     = var.network.vnet
  tags              = var.tags
}

locals {
  Project-vnet = module.Project-vnet.virtual_network
}