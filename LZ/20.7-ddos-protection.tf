resource azurerm_network_ddos_protection_plan Project_ddos_protection_plan {
  count               = var.deployOptionalFeatures.ddos_protection_plan ? 1 : 0
  name                = "${var.env}CNR-${var.group}_${var.project}-ddos"
  location            = azurerm_resource_group.Network-rg.location
  resource_group_name = azurerm_resource_group.Network-rg.name
  tags                = var.tags
}
