# https://github.com/Azure/Enterprise-Scale/blob/main/docs/reference/contoso/e2e-landing-zone-vwan-orchestration.parameters.json

resource "azurerm_policy_definition" "Deploy-NSG-FlowLogs" {
  # count        = var.deployOptionalFeatures.deny_publicips_on_nics ? 1 : 0
  name         = "Deploy-NSG-FlowLogs"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Deploy-NSG-FlowLogs"
  description  = "Apply diagnostic settings for Azure Automation Accounts - Log Analytics"
  parameters   = <<PARAMETERS
  {
    "retention": {
      "type": "Integer",
      "metadata": {
        "displayName": "Retention"
      }
    },
    "storageAccountResourceId": {
      "type": "String",
      "metadata": {
        "displayName": "Storage Account Resource Id"
      }
    },
    "workspaceId": {
      "type": "String",
      "metadata": {
        "displayName": "workspaceId"
      }
    },
    "workspaceRegion": {
      "type": "String",
      "metadata": {
        "displayName": "workspaceRegion"
      }
    },
    "workspaceResourceId": {
      "type": "String",
      "metadata": {
        "displayName": "workspaceResourceId"
      }
    },
    "trafficAnalyticsInterval": {
      "type": "Integer",
      "metadata": {
        "trafficAnalyticsInterval": "trafficAnalyticsInterval in minutes"
      }
    }
  }
PARAMETERS
  policy_rule  = <<POLICY_RULE
  {
    "if": {
      "field": "type",
      "equals": "Microsoft.Network/networkSecurityGroups"
    },
    "then": {
      "effect": "deployIfNotExists",
      "details": {
        "type": "Microsoft.Network/networkWatchers/flowLogs",
        "roleDefinitionIds": [
          "/providers/Microsoft.Authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c"
        ],
        "name": "[concat('NetworkWatcher_', toLower(field('location')), '/', field('name'), '-', resourceGroup().name, '-flowlog')]",
        "resourceGroupName": "NetworkWatcherRG",
        "existenceCondition": {
          "field": "Microsoft.Network/networkWatchers/flowLogs/enabled",
          "equals": "true"
        },
        "deployment": {
          "properties": {
            "mode": "incremental",
            "parameters": {
              "networkSecurityGroupName": {
                "value": "[field('name')]"
              },
              "resourceGroupName": {
                "value": "[resourceGroup().name]"
              },
              "location": {
                "value": "[field('location')]"
              },
              "storageAccountResourceId": {
                "value": "[parameters('storageAccountResourceId')]"
              },
              "retention": {
                "value": "[parameters('retention')]"
              },
              "workspaceId": {
                "value": "[parameters('workspaceId')]"
              },
              "workspaceRegion": {
                "value": "[parameters('workspaceRegion')]"
              },
              "workspaceResourceId": {
                "value": "[parameters('workspaceResourceId')]"
              },
              "trafficAnalyticsInterval": {
                "value": "[parameters('trafficAnalyticsInterval')]"
              }
            },
            "template": {
              "$schema": "https://schema.management.azure.com/schemas/2015-01-01/deploymentTemplate.json#",
              "contentVersion": "1.0.0.0",
              "parameters": {
                "networkSecurityGroupName": {
                  "type": "string"
                },
                "resourceGroupName": {
                  "type": "string"
                },
                "location": {
                  "type": "string"
                },
                "storageAccountResourceId": {
                  "type": "string"
                },
                "retention": {
                  "type": "int",
                  "defaultValue": 5
                },
                "workspaceId": {
                  "type": "string"
                },
                "workspaceRegion": {
                  "type": "string"
                },
                "workspaceResourceId": {
                  "type": "string"
                },
                "trafficAnalyticsInterval": {
                  "type": "int",
                  "defaultValue": 10
                }
              },
              "variables": {},
              "resources": [
                {
                  "type": "Microsoft.Network/networkWatchers/flowLogs",
                  "apiVersion": "2019-11-01",
                  "name": "[concat('NetworkWatcher_', toLower(parameters('location')), '/', parameters('networkSecurityGroupName'), '-', parameters('resourceGroupName'), '-flowlog')]",
                  "location": "[parameters('location')]",
                  "properties": {
                    "targetResourceId": "[resourceId(parameters('resourceGroupName'), 'Microsoft.Network/networkSecurityGroups', parameters('networkSecurityGroupName'))]",
                    "storageId": "[parameters('storageAccountResourceId')]",
                    "enabled": true,
                    "retentionPolicy": {
                      "enabled": true,
                      "days": "[parameters('retention')]"
                    },
                    "format": {
                      "type": "JSON",
                      "version": 2
                    },
                    "flowAnalyticsConfiguration": {
                      "networkWatcherFlowAnalyticsConfiguration": {
                        "enabled": true,
                        "workspaceId": "[parameters('workspaceId')]",
                        "workspaceRegion": "[parameters('workspaceRegion')]",
                        "workspaceResourceId": "[parameters('workspaceResourceId')]",
                        "trafficAnalyticsInterval": "[parameters('trafficAnalyticsInterval')]"
                      }
                    }
                  }
                }
              ],
              "outputs": {}
            }
          }
        }
      }
    }
  }
POLICY_RULE
}

resource "azurerm_policy_assignment" "Deploy-NSG-FlowLogs" {
  # count                = var.deployOptionalFeatures.deny_publicips_on_nics ? 1 : 0
  name                 = "Deploy-NSG-FlowLogs"
  location             = local.Project-law.location
  scope                = data.azurerm_subscription.primary.id
  policy_definition_id = azurerm_policy_definition.Deploy-NSG-FlowLogs.id
  display_name         = "Deploy-NSG-FlowLogs"
  description          = "Apply flow logs settings for Azure NSG"
  identity {
    type = "SystemAssigned"
  }
  parameters = <<PARAMETERS
  {
    "retention": {
      "value": 30
    },
    "storageAccountResourceId": {
      "value": "${local.Project_law-sa.id}"
    },
    "workspaceId": {
      "value": "${local.Project-law.workspace_id}"
    },
    "workspaceRegion": {
      "value": "${local.Project-law.location}"
    },
    "workspaceResourceId": {
      "value": "${local.Project-law.id}"
    },
    "trafficAnalyticsInterval": {
      "value": 10
    }
  }
PARAMETERS
}
/*
resource "azurerm_policy_remediation" "Deploy-NSG-FlowLogs" {
  name                 = lower("Deploy-NSG-FlowLogs-policy-remediation")
  scope                = azurerm_policy_assignment.Deploy-NSG-FlowLogs.scope
  policy_assignment_id = azurerm_policy_assignment.Deploy-NSG-FlowLogs.id
  # location_filters     = ["West Europe"]
}
*/