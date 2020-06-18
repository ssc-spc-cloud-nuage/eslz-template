resource "azurerm_key_vault" "Project-kv" {
  name                            = "${substr("${var.env}CKV-${var.project}-${substr(sha1("${data.azurerm_resource_group.Project-rg.id}"), 0, 8)}", 0, 21)}-kv"
  location                        = data.azurerm_resource_group.Project-rg.location
  resource_group_name             = data.azurerm_resource_group.Project-rg.name
  sku_name                        = "standard"
  tenant_id                       = data.azurerm_client_config.current.tenant_id
  enabled_for_deployment          = true
  enabled_for_disk_encryption     = true
  enabled_for_template_deployment = true
  tags                            = var.tags
}

# azurerm_monitor_diagnostic_setting is required for PBMM-Guardrails

resource "azurerm_monitor_diagnostic_setting" "Project-kv-logs" {
  name                       = "${var.env}CKV-${var.group}-logs"
  target_resource_id         = azurerm_key_vault.Project-kv.id
  log_analytics_workspace_id = data.azurerm_log_analytics_workspace.Project-law.id

  log {
    category = "AuditEvent"
    enabled  = true

    retention_policy {
      enabled = true
      days    = 365
    }
  }

  metric {
    category = "AllMetrics"
    enabled  = true

    retention_policy {
      enabled = true
      days    = 365
    }
  }
}

# Keyvault RBAC

resource "azurerm_key_vault_access_policy" "service_principal" {
  key_vault_id = azurerm_key_vault.Project-kv.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = data.azuread_group.Project_Contributors.id
  key_permissions = [
    "Get",
    "List",
    "Update",
    "Create",
    "Import",
    "Delete",
    "Recover",
    "Backup",
    "Restore",
  ]
  secret_permissions = [
    "Get",
    "List",
    "Set",
    "Delete",
    "Recover",
    "Backup",
    "Restore",
    "Purge",
  ]
  certificate_permissions = [
    "Get",
    "List",
    "Update",
    "Create",
    "Import",
    "Delete",
    "Recover",
    "Backup",
    "Restore",
    "ManageContacts",
    "ManageIssuers",
    "GetIssuers",
    "ListIssuers",
    "SetIssuers",
    "DeleteIssuers",
  ]
}
/*
resource "azurerm_key_vault_secret" "linuxDefaultPassword" {
  name         = "linuxDefaultPassword"
  value        = "Canada123!"
  key_vault_id = azurerm_key_vault.subscription-main-kv.id
  depends_on   = [azurerm_key_vault_access_policy.service_principal]
}
*/
