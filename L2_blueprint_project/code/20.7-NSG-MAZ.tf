locals {
  Project_MAZ-nsg-postfix = "_MAZ-nsg"
  Project_MAZ-nsg-regex   = regex("[0-9A-Za-z-_.]+", "${var.env}CNR-${var.group}_${var.project}")
  Project_MAZ-nsg-substr  = substr(local.Project_MAZ-nsg-regex, 0, 80 - length(local.Project_MAZ-nsg-postfix))
  Project_MAZ-nsg-result  = "${local.Project_MAZ-nsg-substr}${local.Project_MAZ-nsg-postfix}"
}

resource "azurerm_network_security_group" "Project_MAZ-nsg" {
  name                = local.Project_MAZ-nsg-result
  location            = local.resource_groups_L1.Network.location
  resource_group_name = local.resource_groups_L1.Network.name

  security_rule {
    name                       = "AllowAzureResourceCommIP" # https://docs.microsoft.com/en-us/azure/virtual-network/what-is-ip-address-168-63-129-16
    access                     = "Allow"
    priority                   = "100"
    protocol                   = "*"
    direction                  = "Inbound"
    source_port_range          = "*"
    source_address_prefix      = "168.63.129.16"
    destination_port_range     = "*"
    destination_address_prefix = "*"
  }
  security_rule {
    name                       = "AllowAllFromF5"
    access                     = "Allow"
    priority                   = "110"
    protocol                   = "*"
    direction                  = "Inbound"
    source_port_range          = "*"
    source_address_prefixes    = var.RDS-Gateways
    destination_port_range     = "*"
    destination_address_prefix = "*"
  }
  security_rule {
    name                       = "AllowAllOnLocalSubnet"
    access                     = "Allow"
    priority                   = "200"
    protocol                   = "*"
    direction                  = "Inbound"
    source_port_range          = "*"
    source_address_prefixes    = local.subnets.MAZ.address_prefixes
    destination_port_range     = "*"
    destination_address_prefix = "*" # Implicit local subnet destination
  }
  security_rule {
    name                       = "DenyAllInbound"
    access                     = "Deny"
    priority                   = "4050"
    protocol                   = "*"
    direction                  = "Inbound"
    source_port_range          = "*"
    source_address_prefix      = "*"
    destination_port_range     = "*"
    destination_address_prefix = "*"
  }
  tags = var.tags
}

resource azurerm_subnet_network_security_group_association Project_MAZ-nsg-Association {
  subnet_id                 = local.subnets.MAZ.id
  network_security_group_id = azurerm_network_security_group.Project_MAZ-nsg.id
}
/*
resource "azurerm_network_watcher_flow_log" "Network-Project_MAZ-flow" {
  network_watcher_name = "NetworkWatcher_canadacentral"
  resource_group_name  = "NetworkWatcherRG"

  network_security_group_id = azurerm_network_security_group.Project_MAZ-nsg.id
  storage_account_id        = local.Project_law-sa.id
  enabled                   = true

  retention_policy {
    enabled = true
    days    = 7
  }

  traffic_analytics {
    enabled               = true
    workspace_id          = local.Project-law.workspace_id
    workspace_region      = local.Project-law.location
    workspace_resource_id = local.Project-law.id
    interval_in_minutes   = 10
  }
}
*/
/*
resource "azurerm_monitor_diagnostic_setting" "Project_MAZ-nsg-logs" {
  name                       = "${var.env}CNR-${var.group}_${var.project}_MAZ-nsg-logs"
  target_resource_id         = azurerm_network_security_group.Project_MAZ-nsg.id
  log_analytics_workspace_id = local.Project-law.id

  log {
    category = "NetworkSecurityGroupEvent"
    enabled  = true

    retention_policy {
      enabled = false
    }
  }

  log {
    category = "NetworkSecurityGroupRuleCounter"
    enabled  = true

    retention_policy {
      enabled = false
    }
  }
}
*/