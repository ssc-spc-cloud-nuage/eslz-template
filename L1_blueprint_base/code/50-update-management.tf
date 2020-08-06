#This type should eventually replace the manual deploy via azurerm: azurerm_automation_softwareUpdateConfigurations
#https://github.com/terraform-providers/terraform-provider-azurerm/issues/2812
#https://docs.microsoft.com/en-us/rest/api/automation/softwareupdateconfigurations/create
#
# To re-schedule in case the schedule was deleted do the following:
#
# 1. Delete the deployment of the schedule in the automationaccount deployments
# 2. Use terraform taint 'time_offset.tomorrow' to force the time to be recalculated the next time you deploy

resource "time_offset" "tomorrow" {
  offset_days = 1
}

locals {
  update_time = "00:00"
  update_date = substr(time_offset.tomorrow.rfc3339, 0, 10)
}

resource "azurecaf_naming_convention" "dtcafgen" {
  name          = "${local.update_date}T${local.update_time}"
  resource_type = "gen"
  convention    = "passthrough"
}

module "linux-weekly-updates" {
  source                     = "github.com/canada-ca-terraform-modules/terraform-azurerm_update_management?ref=20200622.1"
  deploy                     = var.deployOptionalFeatures.update_management
  name                       = substr("${local.prefix}-${var.project}-${azurecaf_naming_convention.dtcafgen.result}-linux-weekly-updates", 0, 64)
  resource_group_name        = local.resource_groups_L1.AutomationAccount.name
  azurerm_automation_account = azurerm_automation_account.Project-aa
  operatingSystem            = "Linux"
  scope                      = [data.azurerm_subscription.primary.id]               # Whole subscription
  startTime                  = "${local.update_date}T${local.update_time}:00-00:00" # "2020-06-16T00:00:00-00:00"
  weekDays                   = ["Sunday"]
}

module "windows-weekly-updates" {
  source                     = "github.com/canada-ca-terraform-modules/terraform-azurerm_update_management?ref=20200622.1"
  deploy                     = var.deployOptionalFeatures.update_management
  name                       = substr("${local.prefix}-${var.project}-${azurecaf_naming_convention.dtcafgen.result}-windows-weekly-updates", 0, 64)
  resource_group_name        = local.resource_groups_L1.AutomationAccount.name
  azurerm_automation_account = azurerm_automation_account.Project-aa
  operatingSystem            = "Windows"
  scope                      = [data.azurerm_subscription.primary.id]               # Whole subscription
  startTime                  = "${local.update_date}T${local.update_time}:00-00:00" # "2020-06-16T00:00:00-00:00"
  weekDays                   = ["Sunday"]
}
