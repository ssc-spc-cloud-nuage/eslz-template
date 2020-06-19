module "SRV-linux-mgmt" {
  source         = "github.com/canada-ca-terraform-modules/terraform-azurerm_linux_virtual_machine?ref=20200612.1"
  name           = "${var.env}SRV-linux-mgmt"
  resource_group = data.azurerm_resource_group.Management-rg
  location       = data.azurerm_resource_group.Management-rg.location
  storage_image_reference = {
    publisher = "RedHat",
    offer     = "RHEL",
    sku       = "7-LVM",
    version   = "7.7.2020031212"
  }
  priority                = try(var.vmConfigs.SRV-linux-mgmt.priority, "Regular")
  nic_subnetName          = data.azurerm_subnet.Project_OZ-snet.name
  nic_vnetName            = data.azurerm_subnet.Project_OZ-snet.virtual_network_name
  nic_resource_group_name = data.azurerm_subnet.Project_OZ-snet.resource_group_name
  admin_username          = try(var.vmConfigs.SRV-linux-mgmt.admin_username, "azureadmin")
  admin_password          = var.vmConfigs.SRV-linux-mgmt.admin_password
  os_managed_disk_type    = try(var.vmConfigs.SRV-linux-mgmt.os_managed_disk_type, "StandardSSD_LRS")
  vm_size                 = var.vmConfigs.SRV-linux-mgmt.vm_size
  dependancyAgent         = true
  tags                    = var.tags
}
