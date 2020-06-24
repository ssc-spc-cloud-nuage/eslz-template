locals {
  Project-vnet-postfix = "-vnet"
  Project-vnet-regex   = regex("[0-9A-Za-z-_.]+", "${var.env}CNR-${var.group}_${var.project}")
  Project-vnet-substr  = substr(local.Project-vnet-regex, 0, 64 - length(local.Project-vnet-postfix))
  Project-vnet-name    = "${local.Project-vnet-substr}${local.Project-vnet-postfix}"
}

resource azurerm_virtual_network Project-vnet {
  name                = local.Project-vnet-name
  location            = azurerm_resource_group.Network-rg.location
  resource_group_name = azurerm_resource_group.Network-rg.name
  address_space       = var.network.vnet
  tags                = var.tags
}

resource "azurerm_monitor_diagnostic_setting" "Project-logs" {
  name                       = "${var.env}CNR-${var.group}_${var.project}-logs"
  target_resource_id         = azurerm_virtual_network.Project-vnet.id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.Project-law.id

  log {
    category = "VMProtectionAlerts"
    enabled  = true

    retention_policy {
      enabled = true
      days    = 30
    }
  }

  metric {
    category = "AllMetrics"
    enabled  = true

    retention_policy {
      enabled = true
      days    = 30
    }
  }
}
