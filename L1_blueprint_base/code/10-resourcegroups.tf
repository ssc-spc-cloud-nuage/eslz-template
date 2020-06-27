# Create a resource group

/*
Example structure for resource_groups map

resource_groups = {
    apim          = { 
                    name     = "-apim-demo"
    },
    networking    = {    
                    name     = "-networking-demo"
    },
    insights      = { 
                    name     = "-insights-demo"
                    location = "francecentral" 
                    tags     = {
                      special     = "France location needed"
                      approver     = "Gunter"
                    }   
    },
}
*/

module resource_groups {
  source = "github.com/canada-ca-terraform-modules/terraform-azurerm-caf-resource_groups?ref=v1.0.0"
  resource_groups = {
    AutomationAccount-rg = { userDefinedString = "${var.project}_AutomationAccount" },
    Backups-rg           = { userDefinedString = "${var.project}_Backups" },
    Network-rg           = { userDefinedString = "${var.project}_Network" },
    Keyvault-rg          = { userDefinedString = "${var.project}_Keyvault" },
    Logs-rg              = { userDefinedString = "${var.project}_Logs" },
    DNS-rg               = { userDefinedString = "${var.project}_DNS" },
    Management-rg        = { userDefinedString = "${var.project}_Management" },
  }
  env      = var.env
  location = var.location
  tags     = var.tags
}

locals {
  resource_groups = module.resource_groups.object
}