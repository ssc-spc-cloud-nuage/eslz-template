//Can't have a "_" in the name, only "-"
resource "azurerm_log_analytics_workspace" "Project-law" {
  name                = "${var.env}CLD-${var.group}-${var.project}-Project-law"
  location            = azurerm_resource_group.Logs-rg.location
  resource_group_name = azurerm_resource_group.Logs-rg.name
  sku                 = "PerGB2018"
  tags                = var.tags
}

resource "azurerm_log_analytics_solution" "ServiceMap" {
  solution_name         = "ServiceMap"
  location              = azurerm_resource_group.Logs-rg.location
  resource_group_name   = azurerm_resource_group.Logs-rg.name
  workspace_resource_id = azurerm_log_analytics_workspace.Project-law.id
  workspace_name        = azurerm_log_analytics_workspace.Project-law.name
  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/ServiceMap"
  }
}

resource "azurerm_log_analytics_solution" "AzureActivity" {
  solution_name         = "AzureActivity"
  location              = azurerm_resource_group.Logs-rg.location
  resource_group_name   = azurerm_resource_group.Logs-rg.name
  workspace_resource_id = azurerm_log_analytics_workspace.Project-law.id
  workspace_name        = azurerm_log_analytics_workspace.Project-law.name
  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/AzureActivity"
  }
}

# Add Updates workspace solution to log analytics.
# Adding this solution to the log analytics workspace, combined with above linked service resource enables update management for the automation account.
resource "azurerm_log_analytics_solution" "Updates" {
  solution_name         = "Updates"
  location              = azurerm_resource_group.Logs-rg.location
  resource_group_name   = azurerm_resource_group.Logs-rg.name
  workspace_resource_id = azurerm_log_analytics_workspace.Project-law.id
  workspace_name        = azurerm_log_analytics_workspace.Project-law.name
  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/Updates"
  }
}

# Add ChangeTracking workspace solution to log analytics.
# Adding this solution to the log analytics workspace, combined with above linked service resource enables Change Tracking and Inventory for the automation account.
resource "azurerm_log_analytics_solution" "ChangeTracking" {
  solution_name         = "ChangeTracking"
  location              = azurerm_resource_group.Logs-rg.location
  resource_group_name   = azurerm_resource_group.Logs-rg.name
  workspace_resource_id = azurerm_log_analytics_workspace.Project-law.id
  workspace_name        = azurerm_log_analytics_workspace.Project-law.name
  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/ChangeTracking"
  }
}

resource "azurerm_log_analytics_datasource_windows_event" "windows_Application_event" {
  name                = "windows_Application_event"
  resource_group_name = azurerm_resource_group.Logs-rg.name
  workspace_name      = azurerm_log_analytics_workspace.Project-law.name
  event_log_name      = "Application"
  event_types         = ["error", "warning"]
}

resource "azurerm_log_analytics_datasource_windows_event" "windows_System_event" {
  name                = "windows_System_event"
  resource_group_name = azurerm_resource_group.Logs-rg.name
  workspace_name      = azurerm_log_analytics_workspace.Project-law.name
  event_log_name      = "System"
  event_types         = ["error", "warning"]
}
