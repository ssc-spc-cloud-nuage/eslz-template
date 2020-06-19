resource azurerm_private_dns_zone privatezone1 {
  name                = var.privatedomain.name
  resource_group_name = azurerm_resource_group.DNS-rg.name
  tags                = var.tags
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatezone1-vnet_link" {
  name                  = lower("${var.env}CNR-${var.group}_${var.project}_privatezone1-vnet_link") # Need to set to lower to avoid a case sensitivity bug
  resource_group_name   = azurerm_resource_group.DNS-rg.name
  private_dns_zone_name = azurerm_private_dns_zone.privatezone1.name
  virtual_network_id    = azurerm_virtual_network.Project-vnet.id
  registration_enabled  = var.privatedomain.registration_enabled

  #lifecycle {
  #  ignore_changes = [name]
  #}
}
