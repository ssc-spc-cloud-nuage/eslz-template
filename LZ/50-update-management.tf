#This type should eventually replace the manual deploy via azurerm: azurerm_automation_softwareUpdateConfigurations
#https://github.com/terraform-providers/terraform-provider-azurerm/issues/2812
#https://docs.microsoft.com/en-us/rest/api/automation/softwareupdateconfigurations/create
#
# To re-schedule in case the schedule was deleted do the following:
#
# 1. Delete the deployment of the schedule in the automationaccount-rg deployments
# 2. Use terraform taint 'time_offset.tomorrow' to force the time to be recalculated the next time you deploy

resource "time_offset" "tomorrow" {
  offset_days = 1
}

locals {
  update_time = "00:00"
  update_date = substr(time_offset.tomorrow.rfc3339, 0, 10)
}

module "linux-weekly-updates" {
  source                     = "github.com/canada-ca-terraform-modules/terraform-azurerm_update_management?ref=20200527.1"
  name                       = "${local.prefix}-${var.project}-linux-weekly-updates"
  resource_group_name        = azurerm_resource_group.AutomationAccount-rg.name
  azurerm_automation_account = azurerm_automation_account.Project-aa
  operatingSystem            = "Linux"
  scope                      = [data.azurerm_subscription.primary.id] # Whole subscription
  startTime                  = "${local.update_date}T${local.update_time}:00-00:00" # "2020-06-16T00:00:00-00:00"
  weekDays                   = ["Sunday"]
}

module "windows-weekly-updates" {
  source                     = "github.com/canada-ca-terraform-modules/terraform-azurerm_update_management?ref=20200527.1"
  name                       = "${local.prefix}-${var.project}-windows-weekly-updates"
  resource_group_name        = azurerm_resource_group.AutomationAccount-rg.name
  azurerm_automation_account = azurerm_automation_account.Project-aa
  operatingSystem            = "Windows"
  scope                      = [data.azurerm_subscription.primary.id] # Whole subscription
  startTime                  = "${local.update_date}T${local.update_time}:00-00:00" # "2020-06-16T00:00:00-00:00"
  weekDays                   = ["Sunday"]
}
