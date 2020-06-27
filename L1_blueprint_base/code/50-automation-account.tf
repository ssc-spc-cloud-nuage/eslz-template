resource "azurecaf_naming_convention" "Project-aa" {
  name          = "${local.prefix}-${var.project}"
  resource_type = "aaa"
  postfix       = "aa"
  convention    = "passthrough"
}

//Can't have a "_" in the name, only "-"
resource "azurerm_automation_account" "Project-aa" {
  name                = azurecaf_naming_convention.Project-aa.result
  resource_group_name = local.resource_groups.AutomationAccount-rg.name
  location            = var.location
  sku_name            = "Basic"
  tags                = var.tags
}

# Link automation account to a Log Analytics Workspace.
resource "azurerm_log_analytics_linked_service" "law_link" {
  resource_group_name = local.resource_groups.Logs-rg.name
  workspace_name      = module.Project-law.name
  linked_service_name = "automation"
  resource_id         = azurerm_automation_account.Project-aa.id
}

# azurerm_monitor_diagnostic_setting is required for PBMM-Guardrails

resource "azurerm_monitor_diagnostic_setting" "Project_automation_account-logs" {
  name                       = "${azurerm_automation_account.Project-aa.name}-logs"
  target_resource_id         = azurerm_automation_account.Project-aa.id
  log_analytics_workspace_id = module.Project-law.id

  log {
    category = "JobLogs"
    enabled  = true

    retention_policy {
      enabled = true
      days    = 30
    }
  }

  log {
    category = "JobStreams"
    enabled  = true

    retention_policy {
      enabled = true
      days    = 30
    }
  }

  log {
    category = "DscNodeStatus"
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
