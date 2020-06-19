# Subnets

resource "azurerm_subnet" "Project_PAZ-snet" {
  name                 = "${var.env}CNR-${var.group}_${var.project}_PAZ-snet"
  virtual_network_name = azurerm_virtual_network.Project-vnet.name
  resource_group_name  = azurerm_resource_group.Network-rg.name
  address_prefixes     = [var.Project-subnets.PAZ]
}

resource azurerm_subnet_route_table_association Project_PAZ-rta {
  subnet_id      = azurerm_subnet.Project_PAZ-snet.id
  route_table_id = azurerm_route_table.Global-rt.id
}

resource "azurerm_subnet" "Project_OZ-snet" {
  name                 = "${var.env}CNR-${var.group}_${var.project}_OZ-snet"
  virtual_network_name = azurerm_virtual_network.Project-vnet.name
  resource_group_name  = azurerm_resource_group.Network-rg.name
  address_prefixes     = [var.Project-subnets.OZ]
}

resource azurerm_subnet_route_table_association Project_OZ-rta {
  subnet_id      = azurerm_subnet.Project_OZ-snet.id
  route_table_id = azurerm_route_table.Global-rt.id
}

resource "azurerm_subnet" "Project_RZ-snet" {
  name                 = "${var.env}CNR-${var.group}_${var.project}_RZ-snet"
  virtual_network_name = azurerm_virtual_network.Project-vnet.name
  resource_group_name  = azurerm_resource_group.Network-rg.name
  address_prefixes     = [var.Project-subnets.RZ]
}

resource azurerm_subnet_route_table_association Project_RZ-rta {
  subnet_id      = azurerm_subnet.Project_RZ-snet.id
  route_table_id = azurerm_route_table.Global-rt.id
}

resource "azurerm_subnet" "Project_MAZ-snet" {
  name                 = "${var.env}CNR-${var.group}_${var.project}_MAZ-snet"
  virtual_network_name = azurerm_virtual_network.Project-vnet.name
  resource_group_name  = azurerm_resource_group.Network-rg.name
  address_prefixes     = [var.Project-subnets.MAZ]
}

resource azurerm_subnet_route_table_association Project_MAZ-rta {
  subnet_id      = azurerm_subnet.Project_MAZ-snet.id
  route_table_id = azurerm_route_table.Global-rt.id
}