// Recovery Service Vault name must be 2 - 50 characters long, start with a letter, contain only letters, numbers and hyphens.
resource azurerm_recovery_services_vault Project-rv {
  count               = var.deployOptionalFeatures.recovery_services_vault ? 1 : 0
  name                = "${var.env}CNR-${var.group}-${var.project}-rv"
  location            = local.resource_groups.Backups-rg.location
  resource_group_name = local.resource_groups.Backups-rg.name
  sku                 = try(var.optionalFeaturesConfig.recovery_services_vault.sku, "Standard")
  soft_delete_enabled = try(var.optionalFeaturesConfig.recovery_services_vault.soft_delete_enabled, true)
  tags                = var.tags
}

# azurerm_monitor_diagnostic_setting is required for PBMM-Guardrails

resource "azurerm_monitor_diagnostic_setting" "Project_recovery_services_vault-logs" {
  count                      = var.deployOptionalFeatures.recovery_services_vault ? 1 : 0
  name                       = "${azurerm_recovery_services_vault.Project-rv[0].name}-logs"
  target_resource_id         = azurerm_recovery_services_vault.Project-rv[0].id
  log_analytics_workspace_id = module.Project-law.id

  log {
    category = "AzureBackupReport"
    enabled  = true

    retention_policy {
      enabled = true
      days    = 30
    }
  }

  log {
    category = "CoreAzureBackup"
    enabled  = true

    retention_policy {
      enabled = true
      days    = 30
    }
  }

  log {
    category = "AddonAzureBackupJobs"
    enabled  = true

    retention_policy {
      enabled = true
      days    = 30
    }
  }

  log {
    category = "AddonAzureBackupAlerts"
    enabled  = true

    retention_policy {
      enabled = true
      days    = 30
    }
  }

  log {
    category = "AddonAzureBackupPolicy"
    enabled  = true

    retention_policy {
      enabled = true
      days    = 30
    }
  }

  log {
    category = "AddonAzureBackupStorage"
    enabled  = true

    retention_policy {
      enabled = true
      days    = 30
    }
  }

  log {
    category = "AddonAzureBackupProtectedInstance"
    enabled  = true

    retention_policy {
      enabled = true
      days    = 30
    }
  }

  log {
    category = "AzureSiteRecoveryJobs"
    enabled  = true

    retention_policy {
      enabled = true
      days    = 30
    }
  }

  log {
    category = "AzureSiteRecoveryEvents"
    enabled  = true

    retention_policy {
      enabled = true
      days    = 30
    }
  }

  log {
    category = "AzureSiteRecoveryReplicatedItems"
    enabled  = true

    retention_policy {
      enabled = true
      days    = 30
    }
  }

  log {
    category = "AzureSiteRecoveryReplicationStats"
    enabled  = true

    retention_policy {
      enabled = true
      days    = 30
    }
  }

  log {
    category = "AzureSiteRecoveryRecoveryPoints"
    enabled  = true

    retention_policy {
      enabled = true
      days    = 30
    }
  }

  log {
    category = "AzureSiteRecoveryReplicationDataUploadRate"
    enabled  = true

    retention_policy {
      enabled = true
      days    = 30
    }
  }

  log {
    category = "AzureSiteRecoveryProtectedDiskDataChurn"
    enabled  = true

    retention_policy {
      enabled = true
      days    = 30
    }
  }
}
