data azurerm_automation_account Project-aa {
  name = var.automationAccountName
  resource_group_name = var.automationAccountResourceGroupName
}
/*
resource "azurerm_automation_account" "Project-aa" {
  name                = "${local.prefix}-${var.project}-aa"
  resource_group_name = data.azurerm_resource_group.Project-rg.name
  location            = var.location
  sku_name            = "Basic"
  tags                = var.tags
}

# Link automation account to a Log Analytics Workspace.
resource "azurerm_log_analytics_linked_service" "law_link" {
  resource_group_name = data.azurerm_resource_group.Project-rg.name
  workspace_name      = azurerm_log_analytics_workspace.Project-law.name
  linked_service_name = "automation"
  resource_id         = azurerm_automation_account.Project-aa.id
}

resource "azurerm_monitor_diagnostic_setting" "Project_automation_account-logs" {
  name                       = "${local.prefix}-${var.project}-automation_account-logs"
  target_resource_id         = azurerm_automation_account.Project-aa.id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.Project-law.id

  log {
    category = "JobLogs"
    enabled  = true

    retention_policy {
      enabled = false
    }
  }

  log {
    category = "JobStreams"
    enabled  = true

    retention_policy {
      enabled = false
    }
  }

  log {
    category = "DscNodeStatus"
    enabled  = true

    retention_policy {
      enabled = false
    }
  }

  metric {
    category = "AllMetrics"
    enabled  = true

    retention_policy {
      days    = 0
      enabled = false
    }
  }
}
*/