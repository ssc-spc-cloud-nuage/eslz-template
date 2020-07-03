module Project-rsv {
  source              = "github.com/canada-ca-terraform-modules/terraform-azurerm-caf-recovery_services_vault?ref=v1.0.0"
  deploy              = var.deployOptionalFeatures.recovery_services_vault ? true : false
  env                 = var.env
  userDefinedString   = "${var.group}_${var.project}"
  resource_group      = local.resource_groups_L1.Backups
  sku                 = try(var.optionalFeaturesConfig.recovery_services_vault.sku, "Standard")
  soft_delete_enabled = try(var.optionalFeaturesConfig.recovery_services_vault.soft_delete_enabled, true)
  tags                = var.tags
}

locals {
  Project-rsv = module.Project-rsv.recovery_services_vault
}

# azurerm_monitor_diagnostic_setting is required for PBMM-Guardrails
/*
resource "azurerm_monitor_diagnostic_setting" "Project_recovery_services_vault-logs" {
  count                      = var.deployOptionalFeatures.recovery_services_vault ? 1 : 0
  name                       = "${local.Project-rsv.name}-logs"
  target_resource_id         = local.Project-rsv.id
  log_analytics_workspace_id = local.Project-law.id

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
*/