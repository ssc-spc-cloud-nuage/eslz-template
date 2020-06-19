module "SWJ-01" {
  source                  = "github.com/canada-ca-terraform-modules/terraform-azurerm_windows_virtual_machine?ref=20200612.1"
  name                    = "${var.env}SWJ-${var.project}01"
  resource_group          = azurerm_resource_group.Management-rg
  location                = azurerm_resource_group.Management-rg.location
  nic_subnetName          = azurerm_subnet.Project_MAZ-snet.name
  nic_vnetName            = azurerm_virtual_network.Project-vnet.name
  nic_resource_group_name = azurerm_resource_group.Network-rg.name
  priority                = try(var.vmConfigs.SWJ-01.priority, "Regular")
  admin_username          = "azureadmin"
  admin_password          = var.vmConfigs.SWJ-01.admin_password
  vm_size                 = var.vmConfigs.SWJ-01.vm_size
  license_type            = "Windows_Server"
  dependancyAgent         = true
  tags                    = var.tags
}
