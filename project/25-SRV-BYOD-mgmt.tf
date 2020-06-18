module "SRV-BYOD-mgmt" {
  # source = "../../modules/terraform-azurerm_linux_virtual_machine"
  source         = "github.com/canada-ca-terraform-modules/terraform-azurerm_linux_virtual_machine?ref=20200612.1"
  deploy         = try(var.vm_configs.SRV-BYOD-mgmt.deploy, true)
  name           = "${var.env}SRV-BYOD-mgmt"
  resource_group = data.azurerm_resource_group.Project-rg
  location       = data.azurerm_resource_group.Project-rg.location
  storage_image_reference = {
    publisher = "RedHat",
    offer     = "RHEL",
    sku       = "7-LVM",
    version   = "7.7.2020031212"
  }
  priority                = try(var.vm_configs.SRV-BYOD-mgmt.priority, "Regular")
  nic_subnetName          = data.azurerm_subnet.Project_OZ-snet.name
  nic_vnetName            = data.azurerm_subnet.Project_OZ-snet.virtual_network_name
  nic_resource_group_name = data.azurerm_subnet.Project_OZ-snet.resource_group_name
  admin_username          = try(var.vm_configs.SRV-BYOD-mgmt.admin_username, "azureadmin")
  admin_password          = var.vm_configs.SRV-BYOD-mgmt.admin_password
  os_managed_disk_type    = try(var.vm_configs.SRV-BYOD-mgmt.os_managed_disk_type, "StandardSSD_LRS")
  vm_size                 = var.vm_configs.SRV-BYOD-mgmt.vm_size
  encryptDisks = {
    KeyVaultResourceId = azurerm_key_vault.Project-kv.id
    KeyVaultURL        = azurerm_key_vault.Project-kv.vault_uri
  }
  monitoringAgent = data.azurerm_log_analytics_workspace.Project-law
  dependancyAgent = true
  public_ip       = false
  tags            = var.tags
}

resource "azurerm_dns_a_record" "SRV-BYOD-mgmt" {
  count               = try(var.vm_configs.SRV-BYOD-mgmt.deploy, true) ? 1 : 0
  zone_name           = data.azurerm_dns_zone.zone1.name
  name                = lower("${var.env}SRV-BYOD-mgmt")
  ttl                 = "60"
  records             = [module.SRV-BYOD-mgmt.nic[0].private_ip_address]
  resource_group_name = data.azurerm_resource_group.DNS-rg.name
}
