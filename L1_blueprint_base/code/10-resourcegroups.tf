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

module resource_groups_L1 {
  source = "github.com/canada-ca-terraform-modules/terraform-azurerm-caf-resource_groups?ref=v1.0.0"
  resource_groups = {
    AutomationAccount = { 
      userDefinedString = "${local.userDefinedStringPrefix}_AutomationAccount"
    },
    Backups           = {
      userDefinedString = "${local.userDefinedStringPrefix}_Backups"
    },
    Network           = {
      userDefinedString = "${local.userDefinedStringPrefix}_Network"
    },
    Keyvault          = {
      userDefinedString = "${local.userDefinedStringPrefix}_Keyvault"
    },
    Logs              = {
      userDefinedString = "${local.userDefinedStringPrefix}_Logs"
    },
    DNS               = {
      userDefinedString = "${local.userDefinedStringPrefix}_DNS"
    },
    Management        = {
      userDefinedString = "${local.userDefinedStringPrefix}_Management"
    },
  }
  env      = var.env
  location = var.location
  tags     = var.tags
}

locals {
  resource_groups_L1 = module.resource_groups_L1.object
}