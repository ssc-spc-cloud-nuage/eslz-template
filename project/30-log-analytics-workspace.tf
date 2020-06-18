data azurerm_log_analytics_workspace Project-law {
  name = var.logAnalyticsWorkspaceName
  resource_group_name = var.logAnalyticsWorkspaceResourceGroupName
}

/*
//Can't have a _ in the name
resource "azurerm_log_analytics_workspace" "Project-law" {
  name                = "${var.env}CLD-${var.group}-${var.project}-law"
  location            = data.azurerm_resource_group.Project-rg.location
  resource_group_name = data.azurerm_resource_group.Project-rg.name
  sku                 = "PerGB2018"
  tags                = var.tags
}

resource "azurerm_log_analytics_solution" "ServiceMap" {
  solution_name         = "ServiceMap"
  location              = data.azurerm_resource_group.Project-rg.location
  resource_group_name   = data.azurerm_resource_group.Project-rg.name
  workspace_resource_id = azurerm_log_analytics_workspace.Project-law.id
  workspace_name        = azurerm_log_analytics_workspace.Project-law.name
  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/ServiceMap"
  }
}

resource "azurerm_log_analytics_solution" "AzureActivity" {
  solution_name         = "AzureActivity"
  location              = data.azurerm_resource_group.Project-rg.location
  resource_group_name   = data.azurerm_resource_group.Project-rg.name
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
  location              = data.azurerm_resource_group.Project-rg.location
  resource_group_name   = data.azurerm_resource_group.Project-rg.name
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
  location              = data.azurerm_resource_group.Project-rg.location
  resource_group_name   = data.azurerm_resource_group.Project-rg.name
  workspace_resource_id = azurerm_log_analytics_workspace.Project-law.id
  workspace_name        = azurerm_log_analytics_workspace.Project-law.name
  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/ChangeTracking"
  }
}

resource "azurerm_log_analytics_datasource_windows_event" "windows_Application_event" {
  name                = "windows_Application_event"
  resource_group_name = data.azurerm_resource_group.Project-rg.name
  workspace_name      = azurerm_log_analytics_workspace.Project-law.name
  event_log_name      = "Application"
  event_types         = ["error", "warning"]
}

resource "azurerm_log_analytics_datasource_windows_event" "windows_System_event" {
  name                = "windows_System_event"
  resource_group_name = data.azurerm_resource_group.Project-rg.name
  workspace_name      = azurerm_log_analytics_workspace.Project-law.name
  event_log_name      = "System"
  event_types         = ["error", "warning"]
}
*/