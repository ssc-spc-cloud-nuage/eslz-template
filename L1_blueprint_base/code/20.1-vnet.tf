module Project-vnet {
  source            = "github.com/canada-ca-terraform-modules/terraform-azurerm-caf-virtual_network?ref=v1.0.0"
  env               = var.env
  userDefinedString = "${var.group}_${var.project}"
  resource_group    = local.resource_groups_L1.Network
  address_space     = var.network.vnet
  tags              = var.tags
}

locals {
  Project-vnet = module.Project-vnet.virtual_network
}

resource "azurerm_monitor_diagnostic_setting" "Project-logs" {
  name                       = "${local.Project-vnet.name}-logs"
  target_resource_id         = local.Project-vnet.id
  log_analytics_workspace_id = local.Project-law.id

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
