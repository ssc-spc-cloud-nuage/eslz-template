# Subnets

locals {
  Project_PAZ-snet-postfix = "_PAZ-snet"
  Project_PAZ-snet-regex   = regex("[0-9A-Za-z-_.]+", "${var.env}CNR-${var.group}_${var.project}")
  Project_PAZ-snet-substr  = substr(local.Project_PAZ-snet-regex, 0, 80 - length(local.Project_PAZ-snet-postfix))
  Project_PAZ-snet-name    = "${local.Project_PAZ-snet-substr}${local.Project_PAZ-snet-postfix}"
}

resource "azurerm_subnet" "Project_PAZ-snet" {
  name                 = local.Project_PAZ-snet-name
  virtual_network_name = azurerm_virtual_network.Project-vnet.name
  resource_group_name  = azurerm_resource_group.Network-rg.name
  address_prefixes     = var.network.subnets.PAZ
}

resource azurerm_subnet_route_table_association Project_PAZ-rta {
  subnet_id      = azurerm_subnet.Project_PAZ-snet.id
  route_table_id = azurerm_route_table.Global-rt.id
}

locals {
  Project_OZ-snet-postfix = "_OZ-snet"
  Project_OZ-snet-regex   = regex("[0-9A-Za-z-_.]+", "${var.env}CNR-${var.group}_${var.project}")
  Project_OZ-snet-substr  = substr(local.Project_OZ-snet-regex, 0, 80 - length(local.Project_OZ-snet-postfix))
  Project_OZ-snet-name    = "${local.Project_OZ-snet-substr}${local.Project_OZ-snet-postfix}"
}

resource "azurerm_subnet" "Project_OZ-snet" {
  name                 = local.Project_OZ-snet-name
  virtual_network_name = azurerm_virtual_network.Project-vnet.name
  resource_group_name  = azurerm_resource_group.Network-rg.name
  address_prefixes     = var.network.subnets.OZ
}

resource azurerm_subnet_route_table_association Project_OZ-rta {
  subnet_id      = azurerm_subnet.Project_OZ-snet.id
  route_table_id = azurerm_route_table.Global-rt.id
}

locals {
  Project_RZ-snet-postfix = "_RZ-snet"
  Project_RZ-snet-regex   = regex("[0-9A-Za-z-_.]+", "${var.env}CNR-${var.group}_${var.project}")
  Project_RZ-snet-substr  = substr(local.Project_RZ-snet-regex, 0, 80 - length(local.Project_RZ-snet-postfix))
  Project_RZ-snet-name    = "${local.Project_RZ-snet-substr}${local.Project_RZ-snet-postfix}"
}

resource "azurerm_subnet" "Project_RZ-snet" {
  name                 = local.Project_RZ-snet-name
  virtual_network_name = azurerm_virtual_network.Project-vnet.name
  resource_group_name  = azurerm_resource_group.Network-rg.name
  address_prefixes     = var.network.subnets.RZ
}

resource azurerm_subnet_route_table_association Project_RZ-rta {
  subnet_id      = azurerm_subnet.Project_RZ-snet.id
  route_table_id = azurerm_route_table.Global-rt.id
}

locals {
  Project_MAZ-snet-postfix = "_MAZ-snet"
  Project_MAZ-snet-regex   = regex("[0-9A-Za-z-_.]+", "${var.env}CNR-${var.group}_${var.project}")
  Project_MAZ-snet-substr  = substr(local.Project_MAZ-snet-regex, 0, 80 - length(local.Project_MAZ-snet-postfix))
  Project_MAZ-snet-name    = "${local.Project_MAZ-snet-substr}${local.Project_MAZ-snet-postfix}"
}

resource "azurerm_subnet" "Project_MAZ-snet" {
  name                 = local.Project_MAZ-snet-name
  virtual_network_name = azurerm_virtual_network.Project-vnet.name
  resource_group_name  = azurerm_resource_group.Network-rg.name
  address_prefixes     = var.network.subnets.MAZ
}

resource azurerm_subnet_route_table_association Project_MAZ-rta {
  subnet_id      = azurerm_subnet.Project_MAZ-snet.id
  route_table_id = azurerm_route_table.Global-rt.id
}