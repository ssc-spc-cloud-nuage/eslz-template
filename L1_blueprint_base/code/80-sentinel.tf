resource "azurerm_log_analytics_solution" "sentinel" {
  count = var.deployOptionalFeatures.sentinel ? 1 : 0

  solution_name         = "SecurityInsights"
  location              = local.resource_groups_L1.Logs.location
  resource_group_name   = local.resource_groups_L1.Logs.name
  workspace_resource_id = local.Project-law.id
  workspace_name        = local.Project-law.name

  plan {
    product   = "OMSGallery/SecurityInsights"
    publisher = "Microsoft"
  }
}
