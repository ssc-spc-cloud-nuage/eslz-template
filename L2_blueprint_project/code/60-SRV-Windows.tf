locals {
  storage_image_reference = {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
  deployList = {
    for x in var.windows_VMs : 
      "${x.serverType}-${x.userDefinedString}${x.postfix}" => x if lookup(x, "deploy", true) != false
  }
}

module "windows_VMs" {
  source = "github.com/canada-ca-terraform-modules/terraform-azurerm-caf-windows_virtual_machine?ref=v1.1.1"
  # for_each = var.windows_VMs
  for_each = local.deployList

  env               = var.env
  serverType        = each.value.serverType
  userDefinedString = each.value.userDefinedString
  postfix           = each.value.postfix
  resource_group    = local.resource_groups_L1[each.value.resource_group]
  location          = local.resource_groups_L1[each.value.resource_group].location
  subnet            = local.subnets[each.value.subnet]
  nic_ip_configuration = {
    private_ip_address            = [lookup(each.value, "private_ip_address_host", "Dynamic") == "Dynamic" ? null : cidrhost(local.subnets[each.value.subnet].address_prefix, each.value.private_ip_address_host)] # Test if private ip host is provided. If yes assign value. If no set to null
    private_ip_address_allocation = [lookup(each.value, "private_ip_address_host", "Dynamic") == "Dynamic" ? "Dynamic" : "Static"]                                                                                 # Test if private ip host is provided. If yes assign Static. If no set to Dynamic
  }
  public_ip               = lookup(each.value, "public_ip", false)
  priority                = lookup(each.value, "priority", "Regular")
  admin_username          = lookup(each.value, "admin_username", "azureadmin")
  admin_password          = each.value.admin_password
  vm_size                 = each.value.vm_size
  storage_image_reference = lookup(each.value, "storage_image_reference", local.storage_image_reference)
  plan                    = lookup(each.value, "plan", null)
  custom_data             = lookup(each.value, "custom_data", false) != false ? base64encode(file(each.value.custom_data)) : null
  encryptDisks = lookup(each.value, "encryptDisks", false) != false ? {
    KeyVaultResourceId = local.Project-kv.id
    KeyVaultURL        = local.Project-kv.vault_uri
  } : null
  license_type    = lookup(each.value, "license_type", "Windows_Server")
  dependancyAgent = lookup(each.value, "dependancyAgent", false)
  shutdownConfig  = lookup(each.value, "shutdownConfig", null)
  tags            = lookup(each.value, "tags", null) == null ? var.tags : merge(var.tags, each.value.tags)
}