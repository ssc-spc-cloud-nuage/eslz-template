// Recovery Service Vault name must be 2 - 50 characters long, start with a letter, contain only letters, numbers and hyphens.
resource azurerm_recovery_services_vault Project-rv {
  count               = var.deployOptionalFeatures.recovery_services_vault ? 1 : 0
  name                = "${var.env}CNR-${var.group}-${var.project}-rv"
  location            = azurerm_resource_group.Backups-rg.location
  resource_group_name = azurerm_resource_group.Backups-rg.name
  sku                 = try(var.optionalFeaturesConfig.recovery_services_vault.sku, "Standard")
  soft_delete_enabled = try(var.optionalFeaturesConfig.recovery_services_vault.soft_delete_enabled, true)
  tags                = var.tags
}

# azurerm_monitor_diagnostic_setting is required for PBMM-Guardrails

resource "azurerm_monitor_diagnostic_setting" "Project_recovery_services_vault-logs" {
  count                      = var.deployOptionalFeatures.recovery_services_vault ? 1 : 0
  name                       = "${azurerm_recovery_services_vault.Project-rv[0].name}-logs"
  target_resource_id         = azurerm_recovery_services_vault.Project-rv[0].id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.Project-law.id

  log {
    category = "AzureBackupReport"
    enabled  = true

    retention_policy {
      enabled = false
    }
  }

  log {
    category = "CoreAzureBackup"
    enabled  = true

    retention_policy {
      enabled = false
    }
  }

  log {
    category = "AddonAzureBackupJobs"
    enabled  = true

    retention_policy {
      enabled = false
    }
  }

  log {
    category = "AddonAzureBackupAlerts"
    enabled  = true

    retention_policy {
      enabled = false
    }
  }

  log {
    category = "AddonAzureBackupPolicy"
    enabled  = true

    retention_policy {
      enabled = false
    }
  }

  log {
    category = "AddonAzureBackupStorage"
    enabled  = true

    retention_policy {
      enabled = false
    }
  }

  log {
    category = "AddonAzureBackupProtectedInstance"
    enabled  = true

    retention_policy {
      enabled = false
    }
  }

  log {
    category = "AzureSiteRecoveryJobs"
    enabled  = true

    retention_policy {
      enabled = false
    }
  }

  log {
    category = "AzureSiteRecoveryEvents"
    enabled  = true

    retention_policy {
      enabled = false
    }
  }

  log {
    category = "AzureSiteRecoveryReplicatedItems"
    enabled  = true

    retention_policy {
      enabled = false
    }
  }

  log {
    category = "AzureSiteRecoveryReplicationStats"
    enabled  = true

    retention_policy {
      enabled = false
    }
  }

  log {
    category = "AzureSiteRecoveryRecoveryPoints"
    enabled  = true

    retention_policy {
      enabled = false
    }
  }

  log {
    category = "AzureSiteRecoveryReplicationDataUploadRate"
    enabled  = true

    retention_policy {
      enabled = false
    }
  }

  log {
    category = "AzureSiteRecoveryProtectedDiskDataChurn"
    enabled  = true

    retention_policy {
      enabled = false
    }
  }
}
