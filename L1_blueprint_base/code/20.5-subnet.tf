# Subnets

module Project-snet {
  source          = "github.com/canada-ca-terraform-modules/terraform-azurerm-caf-subnet?ref=v1.0.1"
  virtual_network = local.Project-vnet
  resource_group  = local.resource_groups_L1.Network
  env             = var.env
  subnets = {
    PAZ = { address_prefixes = var.network.subnets.PAZ },
    OZ  = { address_prefixes = var.network.subnets.OZ },
    RZ  = { address_prefixes = var.network.subnets.RZ },
    MAZ = { address_prefixes = var.network.subnets.MAZ }
  }
  route_tables = {
    PAZ = { route_table = azurerm_route_table.Global-rt },
    OZ  = { route_table = azurerm_route_table.Global-rt },
    RZ  = { route_table = azurerm_route_table.Global-rt },
    MAZ = { route_table = azurerm_route_table.Global-rt }
  }
}

locals {
  subnets = module.Project-snet.object
}
