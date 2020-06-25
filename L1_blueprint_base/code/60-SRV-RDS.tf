resource "azurecaf_naming_convention" "SWJ-01" {
  name          = "${var.env}${var.vmConfigs.SWJ-01.name}"
  resource_type = "vmw"
  convention    = "passthrough"
}

module "SWJ-01" {
  source                  = "github.com/canada-ca-terraform-modules/terraform-azurerm_windows_virtual_machine?ref=20200622.2"
  deploy                  = var.deployOptionalFeatures.jumpServer
  name                    = azurecaf_naming_convention.SWJ-01.result
  resource_group          = azurerm_resource_group.Management-rg
  location                = azurerm_resource_group.Management-rg.location
  nic_subnetName          = module.Project_MAZ-snet.name
  nic_vnetName            = module.Project_MAZ-snet.virtual_network_name
  nic_resource_group_name = module.Project_MAZ-snet.resource_group_name
  priority                = try(var.vmConfigs.SWJ-01.priority, "Regular")
  admin_username          = "azureadmin"
  admin_password          = var.vmConfigs.SWJ-01.admin_password
  vm_size                 = var.vmConfigs.SWJ-01.vm_size
  license_type            = "Windows_Server"
  dependancyAgent         = false
  tags                    = var.tags
}

# azurerm_monitor_diagnostic_setting is required for PBMM-Guardrails

resource "azurerm_monitor_diagnostic_setting" "SWJ-01-logs" {
  count                      = var.deployOptionalFeatures.jumpServer ? 1 : 0
  name                       = "${var.env}SWJ-${var.project}01-logs"
  target_resource_id         = module.SWJ-01.nic[0].id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.Project-law.id

  metric {
    category = "AllMetrics"
    enabled  = true

    retention_policy {
      enabled = true
      days    = 30
    }
  }
}
