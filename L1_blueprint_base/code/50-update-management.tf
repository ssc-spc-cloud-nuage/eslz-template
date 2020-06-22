#This type should eventually replace the manual deploy via azurerm: azurerm_automation_softwareUpdateConfigurations
#https://github.com/terraform-providers/terraform-provider-azurerm/issues/2812
#https://docs.microsoft.com/en-us/rest/api/automation/softwareupdateconfigurations/create
#
# To re-schedule in case the schedule was deleted do the following:
#
# 1. Delete the deployment of the schedule in the automationaccount-rg deployments
# 2. Use terraform taint 'time_offset.tomorrow' to force the time to be recalculated the next time you deploy

resource "time_offset" "tomorrow" {
  count       = var.deployOptionalFeatures.update_management ? 1 : 0
  offset_days = 1
}

locals {
  update_time = "00:00"
  update_date = var.deployOptionalFeatures.update_management ? substr(time_offset.tomorrow[0].rfc3339, 0, 10) : "null"
}

resource "azurecaf_naming_convention" "dtcafgen" {
  count       = var.deployOptionalFeatures.update_management ? 1 : 0
  name    = "${local.update_date}T${local.update_time}"
  resource_type    = "gen"
  convention  = "passthrough"
}

module "linux-weekly-updates" {
  source                     = "github.com/canada-ca-terraform-modules/terraform-azurerm_update_management?ref=20200622.1"
  deploy                     = var.deployOptionalFeatures.update_management
  name                       = "${local.prefix}-${var.project}-${azurecaf_naming_convention.dtcafgen[0].result}-linux-weekly-updates"
  resource_group_name        = azurerm_resource_group.AutomationAccount-rg.name
  azurerm_automation_account = azurerm_automation_account.Project-aa
  operatingSystem            = "Linux"
  scope                      = [data.azurerm_subscription.primary.id]               # Whole subscription
  startTime                  = "${local.update_date}T${local.update_time}:00-00:00" # "2020-06-16T00:00:00-00:00"
  weekDays                   = ["Sunday"]
}

module "windows-weekly-updates" {
  source                     = "github.com/canada-ca-terraform-modules/terraform-azurerm_update_management?ref=20200622.1"
  deploy                     = var.deployOptionalFeatures.update_management
  name                       = "${local.prefix}-${var.project}-${azurecaf_naming_convention.dtcafgen[0].result}-windows-weekly-updates"
  resource_group_name        = azurerm_resource_group.AutomationAccount-rg.name
  azurerm_automation_account = azurerm_automation_account.Project-aa
  operatingSystem            = "Windows"
  scope                      = [data.azurerm_subscription.primary.id]               # Whole subscription
  startTime                  = "${local.update_date}T${local.update_time}:00-00:00" # "2020-06-16T00:00:00-00:00"
  weekDays                   = ["Sunday"]
}
