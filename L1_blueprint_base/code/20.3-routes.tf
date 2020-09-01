locals {
  Global-rt-postfix = "_Global-rt"
  Global-rt-regex   = regex("[0-9A-Za-z-_.]+", "${var.env}CNR-${var.group}_${var.project}")
  Global-rt-substr  = substr(local.Global-rt-regex, 0, 80 - length(local.Global-rt-postfix))
  Global-rt-name    = "${local.Global-rt-substr}${local.Global-rt-postfix}"
}

resource azurerm_route_table Global-rt {
  name                = local.Global-rt-name
  location            = local.resource_groups_L1.Network.location
  resource_group_name = local.resource_groups_L1.Network.name

  dynamic "route" {
    for_each = lookup(var.network, "routes", [])
    content {
      name           = route.value.name
      address_prefix = route.value.address_prefix
      next_hop_type  = route.value.next_hop_type
      next_hop_in_ip_address = lookup(route.value, "next_hop_in_ip_address", null)
    }
  }

  dynamic "route" {
    for_each = var.network.vnet
    content {
      name           = "local_vnet-route-${route.key}"
      address_prefix = route.value
      next_hop_type  = "VnetLocal"
    }
  }

  dynamic "route" {
    for_each = var.deployOptionalFeatures.defaultRoute ? ["default-route"] : []
    content {
      name                   = "default-route"
      address_prefix         = "0.0.0.0/0"
      next_hop_type          = "VirtualAppliance"
      next_hop_in_ip_address = var.Landing-Zone-Next-Hop
    }
  }

  tags = var.tags
}

//52.137.7.191 is the IP for VIP.  172.16.3.8 interface on f5