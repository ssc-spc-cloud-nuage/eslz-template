/*
# Reader access to vnet to allow subnet visibility

resource "azurerm_role_assignment" "Project_Network-vnet-Readers" {
  scope                = azurerm_virtual_network.Project-vnet.id
  role_definition_name = "Reader"
  principal_id         = azuread_group.Project_Project_Readers.id
}

resource "azurerm_role_assignment" "Project_Network-vnet-Contributors" {
  scope                = azurerm_virtual_network.Project-vnet.id
  role_definition_name = "Reader"
  principal_id         = azuread_group.Project_Project_Contributors.id
}

# Reader access to route tables to allow visibility of subnet routes

resource "azurerm_role_assignment" "Project_Network-rt-Readers" {
  scope                = azurerm_route_table.Global-rt.id
  role_definition_name = "Reader"
  principal_id         = azuread_group.Project_Project_Readers.id
}

resource "azurerm_role_assignment" "Project_Network-rt-Contributors" {
  scope                = azurerm_route_table.Global-rt.id
  role_definition_name = "Reader"
  principal_id         = azuread_group.Project_Project_Contributors.id
}
*/

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
/*
# Assign Contributor and Reader roles to subnet
resource "azurerm_role_assignment" "Project_PAZ-snet-Contributors" {
  scope                = azurerm_subnet.Project_PAZ-snet.id
  role_definition_name = "Contributor"
  principal_id         = azuread_group.Project_Project_Contributors.id
}

resource "azurerm_role_assignment" "Project_PAZ-snet-Readers" {
  scope                = azurerm_subnet.Project_PAZ-snet.id
  role_definition_name = "Reader"
  principal_id         = azuread_group.Project_Project_Readers.id
}
*/
# resource azurerm_subnet_network_security_group_association Project_PAZ-nsg-Association {
#   subnet_id                 = azurerm_subnet.Project_PAZ-snet.id
#   network_security_group_id = azurerm_network_security_group.Project_PAZ-nsg.id
# }

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
/*
# Assign Contributor and Reader roles to subnet
resource "azurerm_role_assignment" "Project_OZ-snet-Contributors" {
  scope                = azurerm_subnet.Project_OZ-snet.id
  role_definition_name = "Contributor"
  principal_id         = azuread_group.Project_Project_Contributors.id
}

resource "azurerm_role_assignment" "Project_OZ-snet-Readers" {
  scope                = azurerm_subnet.Project_OZ-snet.id
  role_definition_name = "Reader"
  principal_id         = azuread_group.Project_Project_Readers.id
}
*/
# resource azurerm_subnet_network_security_group_association Project_OZ-nsg-Association {
#   subnet_id                 = azurerm_subnet.Project_OZ-snet.id
#   network_security_group_id = azurerm_network_security_group.Project_OZ-nsg.id
# }

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
/*
# Assign Contributor and Reader roles to subnet
resource "azurerm_role_assignment" "Project_RZ-snet-Contributors" {
  scope                = azurerm_subnet.Project_RZ-snet.id
  role_definition_name = "Contributor"
  principal_id         = azuread_group.Project_Project_Contributors.id
}

resource "azurerm_role_assignment" "Project_RZ-snet-Readers" {
  scope                = azurerm_subnet.Project_RZ-snet.id
  role_definition_name = "Reader"
  principal_id         = azuread_group.Project_Project_Readers.id
}
*/
# resource azurerm_subnet_network_security_group_association Project_RZ-nsg-Association {
#   subnet_id                 = azurerm_subnet.Project_RZ-snet.id
#   network_security_group_id = azurerm_network_security_group.Project_RZ-nsg.id
# }
