# Terraform Azure Update Management

## Introduction

This module deploys VM update schedule and config.

## Security Controls

The following security controls can be met through configuration of this template:

* tbd

## Dependancies

Hard:

* Resource Groups
* automation account

## Usage

```terraform
module "linux-weekly-updates" {
  source              = "github.com/canada-ca-terraform-modules/terraform-azurerm_update_management?ref=20200527.1"
  name                       = "${local.prefix}-${var.project}-linux-weekly-updates"
  resource_group_name        = azurerm_resource_group.EBAP_SAS_VIYA_Private-rg.name
  azurerm_automation_account = azurerm_automation_account.Project-aa
  operatingSystem            = "Linux"
  scope                      = [azurerm_resource_group.EBAP_SAS_VIYA_DMZ-rg.id, azurerm_resource_group.EBAP_SAS_VIYA_Private-rg.id]
  startTime                  = "2020-05-28T00:00:00-00:00"
  weekDays                   = ["Sunday"]
}

module "windows-weekly-updates" {
  source              = "github.com/canada-ca-terraform-modules/terraform-azurerm_update_management?ref=20200527.1"
  name                       = "${local.prefix}-${var.project}-windows-weekly-updates"
  resource_group_name        = azurerm_resource_group.EBAP_SAS_VIYA_Private-rg.name
  azurerm_automation_account = azurerm_automation_account.Project-aa
  operatingSystem            = "Windows"
  scope                      = [azurerm_resource_group.EBAP_SAS_VIYA_DMZ-rg.id, azurerm_resource_group.EBAP_SAS_VIYA_Private-rg.id]
  startTime                  = "2020-05-28T00:00:00-00:00"
  weekDays                   = ["Sunday"]
}
```


## Variables Values

| Name                                    | Type   | Required | Value                                                                                                                                                                                                       |
| --------------------------------------- | ------ | -------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |

** See variables.tf file for now for possible variables and values

## History

| Date     | Release    | Change                                                                                       |
| -------- | ---------- | -------------------------------------------------------------------------------------------- |
| 20200527 | 20200527.1 | 1st commit              |
