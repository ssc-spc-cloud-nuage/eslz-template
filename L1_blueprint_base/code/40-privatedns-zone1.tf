resource azurerm_private_dns_zone privatezone1 {
  name                = var.domain.private.name
  resource_group_name = local.resource_groups_L1.DNS.name
  tags                = var.tags
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatezone1-vnet_link" {
  name                  = lower("${var.env}CNR-${var.group}_${var.project}_privatezone1-vnet_link") # Need to set to lower to avoid a case sensitivity bug
  resource_group_name   = local.resource_groups_L1.DNS.name
  private_dns_zone_name = azurerm_private_dns_zone.privatezone1.name
  virtual_network_id    = local.Project-vnet.id
  registration_enabled  = var.domain.private.registration_enabled

  #lifecycle {
  #  ignore_changes = [name]
  #}
}
