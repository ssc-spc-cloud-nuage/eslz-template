resource "azurerm_log_analytics_solution" "sentinel" {
  count = var.deployOptionalFeatures.sentinel ? 1 : 0

  solution_name         = "SecurityInsights"
  location              = local.resource_groups.Logs-rg.location
  resource_group_name   = local.resource_groups.Logs-rg.name
  workspace_resource_id = module.Project-law.id
  workspace_name        = module.Project-law.name

  plan {
    product   = "OMSGallery/SecurityInsights"
    publisher = "Microsoft"
  }
}
