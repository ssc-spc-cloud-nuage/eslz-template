# Subnets

module Project-snet {
  source          = "github.com/canada-ca-terraform-modules/terraform-azurerm-caf-subnet?ref=v1.0.1"
  virtual_network = azurerm_virtual_network.Project-vnet
  resource_group  = local.resource_groups.Network-rg
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
/*
module Project_PAZ-snet {
  source               = "github.com/canada-ca-terraform-modules/terraform-azurerm-caf-subnet?ref=v1.0.1"
  virtual_network_name = azurerm_virtual_network.Project-vnet.name
  resource_group_name  = local.resource_groups.Network-rg.name
  address_prefixes     = var.network.subnets.PAZ
  subnetShortName      = "PAZ"
  route_table          = azurerm_route_table.Global-rt
}

module Project_OZ-snet {
  source               = "github.com/canada-ca-terraform-modules/terraform-azurerm-caf-subnet?ref=v1.0.1"
  virtual_network_name = azurerm_virtual_network.Project-vnet.name
  resource_group_name  = local.resource_groups.Network-rg.name
  address_prefixes     = var.network.subnets.OZ
  subnetShortName      = "OZ"
  route_table          = azurerm_route_table.Global-rt
}

module Project_RZ-snet {
  source               = "github.com/canada-ca-terraform-modules/terraform-azurerm-caf-subnet?ref=v1.0.1"
  virtual_network_name = azurerm_virtual_network.Project-vnet.name
  resource_group_name  = local.resource_groups.Network-rg.name
  address_prefixes     = var.network.subnets.RZ
  subnetShortName      = "RZ"
  route_table          = azurerm_route_table.Global-rt
}

module Project_MAZ-snet {
  source               = "github.com/canada-ca-terraform-modules/terraform-azurerm-caf-subnet?ref=v1.0.1"
  virtual_network_name = azurerm_virtual_network.Project-vnet.name
  resource_group_name  = local.resource_groups.Network-rg.name
  address_prefixes     = var.network.subnets.MAZ
  subnetShortName      = "MAZ"
  route_table          = azurerm_route_table.Global-rt
}
*/