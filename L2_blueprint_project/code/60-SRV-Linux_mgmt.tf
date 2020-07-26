module "SRV-linux-mgmt" {
  source = "github.com/canada-ca-terraform-modules/terraform-azurerm-caf-linux_virtual_machine?ref=v1.0.0"
  # deploy            = var.deployOptionalFeatures.linuxJumpServer
  env               = var.env
  serverType        = "SLJ"
  userDefinedString = "Linux-MGMT"
  postfix           = "01"
  resource_group    = local.resource_groups_L1.Management
  subnet            = local.subnets.MAZ
  nic_ip_configuration = {
    private_ip_address            = var.vmConfigs.SRV-linux-mgmt.private_ip_address
    private_ip_address_allocation = ["Static"]
  }
  priority       = try(var.vmConfigs.SRV-linux-mgmt.priority, "Regular")
  admin_username = "azureadmin"
  admin_password = var.vmConfigs.SRV-linux-mgmt.admin_password
  vm_size        = var.vmConfigs.SRV-linux-mgmt.vm_size
  tags           = var.tags
}

# azurerm_monitor_diagnostic_setting is required for PBMM-Guardrails
/*
resource "azurerm_monitor_diagnostic_setting" "SRV-linux-mgmt-logs" {
  name                       = "${module.SRV-linux-mgmt.name}-logs"
  target_resource_id         = module.SRV-linux-mgmt.nic[0].id
  log_analytics_workspace_id = local.Project-law.id

  metric {
    category = "AllMetrics"
    enabled  = true

    retention_policy {
      enabled = true
      days    = 30
    }
  }
}
*/