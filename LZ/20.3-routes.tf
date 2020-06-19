resource azurerm_route_table Global-rt {
  name                = "${var.env}CNR-${var.group}_${var.project}_Global-rt"
  location            = azurerm_resource_group.Network-rg.location
  resource_group_name = azurerm_resource_group.Network-rg.name
  route {
    name           = "local_vnet-route"
    address_prefix = var.Project-vnet[0]
    next_hop_type  = "VnetLocal"
  }

  route {
    name                   = "default-route"
    address_prefix         = "0.0.0.0/0"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = var.Landing-Zone-Next-Hop
  }

  tags = var.tags
}

//52.137.7.191 is the IP for VIP.  172.16.3.8 interface on f5