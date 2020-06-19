module "SRV-BYOD-adt" {
  source = "../../modules/terraform-azurerm-active-directory-v2"
  # source         = "github.com/canada-ca-terraform-modules/terraform-azurerm_linux_virtual_machine?ref=20200612.1"
  deploy                = false
  ad_prefix             = "${var.env}SRV-BYODA"
  resourceGroup         = data.azurerm_resource_group.Project-rg
  location              = data.azurerm_resource_group.Project-rg.location
  subnetName            = data.azurerm_subnet.Project_OZ-snet.name
  vnetName              = data.azurerm_subnet.Project_OZ-snet.virtual_network_name
  vnetResourceGroupName = data.azurerm_subnet.Project_OZ-snet.resource_group_name
  admin_username        = "azureadmin"
  admin_password        = "Canada123!"
  managed_disk_type     = "StandardSSD_LRS"
  priority              = "Spot"
  encryptDisks = {
    KeyVaultResourceId = azurerm_key_vault.Project-kv.id
    KeyVaultURL        = azurerm_key_vault.Project-kv.vault_uri
  }
  rootDC1IPAddress    = "172.16.133.90"
  rootDC2IPAddress    = "172.16.133.91"
  ad_domain_name      = "test.gc.local"
  reverse_Zone_Object = ["0.0.10", "1.0.10"]
  monitoringAgent     = data.azurerm_log_analytics_workspace.Project-law
  dependancyAgent     = true
  public_ip           = false
  tags                = var.tags
}
