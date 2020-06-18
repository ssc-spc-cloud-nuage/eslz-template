#This type should eventually replace the manual deploy via azurerm: azurerm_automation_softwareUpdateConfigurations
#https://github.com/terraform-providers/terraform-provider-azurerm/issues/2812
#https://docs.microsoft.com/en-us/rest/api/automation/softwareupdateconfigurations/create

module "linux-weekly-updates" {
  #source = "./modules/terraform-azurerm_update_management"
  source                     = "github.com/canada-ca-terraform-modules/terraform-azurerm_update_management?ref=20200527.1"
  name                       = "${local.prefix}-${var.project}-linux-weekly-updates"
  resource_group_name        = data.azurerm_resource_group.Project-rg.name
  azurerm_automation_account = data.azurerm_automation_account.Project-aa
  operatingSystem            = "Linux"
  scope                      = [data.azurerm_resource_group.Project-rg.id]
  startTime                  = "2020-06-16T00:00:00-00:00"
  weekDays                   = ["Sunday"]
}

module "windows-weekly-updates" {
  #source = "./modules/terraform-azurerm_update_management"
  source                     = "github.com/canada-ca-terraform-modules/terraform-azurerm_update_management?ref=20200527.1"
  name                       = "${local.prefix}-${var.project}-windows-weekly-updates"
  resource_group_name        = data.azurerm_resource_group.Project-rg.name
  azurerm_automation_account = data.azurerm_automation_account.Project-aa
  operatingSystem            = "Windows"
  scope                      = [data.azurerm_resource_group.Project-rg.id]
  startTime                  = "2020-06-16T00:00:00-00:00"
  weekDays                   = ["Sunday"]
}
