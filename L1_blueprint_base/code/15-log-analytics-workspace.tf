# Can't use azurecaf_naming_convention for now due to casing bug https://github.com/aztfmod/terraform-provider-azurecaf/issues/25
# Will use when bug is fixed
/*
resource azurecaf_naming_convention Project-law {  
  name    = "${var.env}CLD-${var.group}-${var.project}-${local.unique_Logs}"
  resource_type    = "la"
  postfix = "law"
  convention  = "passthrough"
}
*/

locals {
  azurecaf_naming_convention-Project-law-replace = replace("${var.env}CLD-${var.group}-${var.project}", "_", "-")
  azurecaf_naming_convention-Project-law-regex   = regex("[0-9A-Za-z-]+", local.azurecaf_naming_convention-Project-law-replace)
  azurecaf_naming_convention-Project-law-54      = substr(local.azurecaf_naming_convention-Project-law-regex, 0, 54)
  azurecaf_naming_convention-Project-law-59      = substr("${local.azurecaf_naming_convention-Project-law-54}-${local.unique_Logs}", 0, 59)
  azurecaf_naming_convention-Project-law-result  = "${local.azurecaf_naming_convention-Project-law-59}-law"
}

//Can't have a "_" in the name, only "-"
resource "azurerm_log_analytics_workspace" "Project-law" {
  # name                = azurecaf_naming_convention.Project-law.result
  name                = local.azurecaf_naming_convention-Project-law-result
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

resource "azurerm_log_analytics_solution" "AgentHealthAssessment" {
  solution_name         = "AgentHealthAssessment"
  location              = azurerm_resource_group.Logs-rg.location
  resource_group_name   = azurerm_resource_group.Logs-rg.name
  workspace_resource_id = azurerm_log_analytics_workspace.Project-law.id
  workspace_name        = azurerm_log_analytics_workspace.Project-law.name
  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/AgentHealthAssessment"
  }
}

resource "azurerm_log_analytics_solution" "DnsAnalytics" {
  solution_name         = "DnsAnalytics"
  location              = azurerm_resource_group.Logs-rg.location
  resource_group_name   = azurerm_resource_group.Logs-rg.name
  workspace_resource_id = azurerm_log_analytics_workspace.Project-law.id
  workspace_name        = azurerm_log_analytics_workspace.Project-law.name
  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/DnsAnalytics"
  }
}

resource "azurerm_log_analytics_solution" "KeyVaultAnalytics" {
  solution_name         = "KeyVaultAnalytics"
  location              = azurerm_resource_group.Logs-rg.location
  resource_group_name   = azurerm_resource_group.Logs-rg.name
  workspace_resource_id = azurerm_log_analytics_workspace.Project-law.id
  workspace_name        = azurerm_log_analytics_workspace.Project-law.name
  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/KeyVaultAnalytics"
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
