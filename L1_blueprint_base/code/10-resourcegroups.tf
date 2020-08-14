# Create a resource group

/*
Example structure for resource_groups map

resource_groups = {
    apim       = { 
                    userDefinedString = "apim-demo"
    },
    networking = {    
                    userDefinedString = "networking-demo"
    },
    insights   = { 
                    userDefinedString = "insights-demo"
                    location          = "francecentral" 
                    tags = {
                      special     = "France location needed"
                      approver     = "Gunter"
                }   
    },
}
*/
locals {
  rglist = {
    AutomationAccount = {
      userDefinedString = "${local.userDefinedStringPrefix}_AutomationAccount"
    },
    Backups = {
      userDefinedString = "${local.userDefinedStringPrefix}_Backups"
    },
    Network = {
      userDefinedString = "${local.userDefinedStringPrefix}_Network"
    },
    Keyvault = {
      userDefinedString = "${local.userDefinedStringPrefix}_Keyvault"
    },
    Logs = {
      userDefinedString = "${local.userDefinedStringPrefix}_Logs"
    },
    DNS = {
      userDefinedString = "${local.userDefinedStringPrefix}_DNS"
    },
    Management = {
      userDefinedString = "${local.userDefinedStringPrefix}_Management"
    },
  }
}

module resource_groups_L1 {
  source = "github.com/canada-ca-terraform-modules/terraform-azurerm-caf-resource_groups?ref=v1.1.0"
  for_each = local.rglist

  userDefinedString = each.value.userDefinedString
  env = var.env
  location = lookup(each.value, "location", var.location)
  tags     = merge(lookup(each.value, "tags", {}), var.tags)
}

locals {
  resource_groups_L1 = module.resource_groups_L1
}
