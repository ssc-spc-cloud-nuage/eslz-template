#This type should eventually replace the manual deploy via azurerm: azurerm_automation_softwareUpdateConfigurations
#https://github.com/terraform-providers/terraform-provider-azurerm/issues/2812
#https://docs.microsoft.com/en-us/rest/api/automation/softwareupdateconfigurations/create

resource "azurerm_template_deployment" "linux" {
    count               = lower(var.operatingSystem) == "linux" ? 1 : 0
    name                = var.name
    resource_group_name = var.resource_group_name

    template_body = <<DEPLOY
    {
        "$schema": "https://schema.management.azure.com/schemas/2015-01-01/deploymentTemplate.json#",
        "contentVersion": "1.0.0.0",
        "resources": [
            {
                "apiVersion": "2017-05-15-preview",
                "type": "Microsoft.Automation/automationAccounts/softwareUpdateConfigurations",
                "name": "${var.azurerm_automation_account.name}/${var.name}",
                "properties": {
                    "updateConfiguration": {
                        "operatingSystem": "${var.operatingSystem}",
                        "duration": "PT${var.duration}H",
                        "linux": {
                            "excludedPackageNameMasks": [],
                            "includedPackageClassifications": "${var.linux_update_types}",
                            "rebootSetting": "${var.rebootSetting}"
                        },
                        "azureVirtualMachines": [],
                        "nonAzureComputerNames": [],
                        "targets": {
                            "azureQueries": [
                                {
                                    "scope": ${jsonencode(var.scope)}
                                }
                            ],
                            "nonAzureQueries": []
                        }
                    },
                    "scheduleInfo": {
                        "frequency": "Week",
                        "startTime": "${var.startTime}",
                        "timeZone": "${var.timeZone}",
                        "interval": ${var.interval},
                        "advancedSchedule": {
                            "weekDays": ${jsonencode(var.weekDays)}
                        }
                    }
                }
            }
        ]
    }
    DEPLOY

    deployment_mode = "Incremental"
}

resource "azurerm_template_deployment" "windows" {
    count               = lower(var.operatingSystem) == "windows" ? 1 : 0
    name                = var.name
    resource_group_name = var.resource_group_name

    template_body = <<DEPLOY
    {
        "$schema": "https://schema.management.azure.com/schemas/2015-01-01/deploymentTemplate.json#",
        "contentVersion": "1.0.0.0",
        "resources": [
            {
                "apiVersion": "2017-05-15-preview",
                "type": "Microsoft.Automation/automationAccounts/softwareUpdateConfigurations",
                "name": "${var.azurerm_automation_account.name}/${var.name}",
                "properties": {
                    "updateConfiguration": {
                        "operatingSystem": "${var.operatingSystem}",
                        "duration": "PT${var.duration}H",
                        "windows": {
                            "excludedKbNumbers": [],
                            "includedUpdateClassifications": "${var.windows_update_types}",
                            "rebootSetting": "${var.rebootSetting}"
                        },
                        "azureVirtualMachines": [],
                        "nonAzureComputerNames": [],
                        "targets": {
                            "azureQueries": [
                                {
                                    "scope": ${jsonencode(var.scope)}
                                }
                            ],
                            "nonAzureQueries": []
                        }
                    },
                    "scheduleInfo": {
                        "frequency": "Week",
                        "startTime": "${var.startTime}",
                        "timeZone": "${var.timeZone}",
                        "interval": ${var.interval},
                        "advancedSchedule": {
                            "weekDays": ${jsonencode(var.weekDays)}
                        }
                    }
                }
            }
        ]
    }
    DEPLOY

    deployment_mode = "Incremental"
}