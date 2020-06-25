resource "azurerm_log_analytics_solution" "sentinel" {
  count = var.deployOptionalFeatures.sentinel ? 1 : 0

  solution_name         = "SecurityInsights"
  location              = azurerm_resource_group.Logs-rg.location
  resource_group_name   = azurerm_resource_group.Logs-rg.name
  workspace_resource_id = module.Project-law.id
  workspace_name        = module.Project-law.name

  plan {
    product   = "OMSGallery/SecurityInsights"
    publisher = "Microsoft"
  }
}
