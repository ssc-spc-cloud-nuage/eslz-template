/*
resource azurecaf_naming_convention Project-kv {
  name          = substr("${local.env_short}CKV-${local.group_short}-${local.project_short}-${local.unique_Keyvault}", 0, 21)
  resource_type = "kv"
  postfix       = "kv"
  convention    = "passthrough"
}
*/

locals {
  azurecaf_naming_convention-Project-kv-16     = substr("${local.env_short}CKV-${local.group_short}-${local.project_short}", 0, 16)
  azurecaf_naming_convention-Project-kv-21     = substr("${local.azurecaf_naming_convention-Project-kv-16}-${local.unique_Keyvault}", 0, 21)
  azurecaf_naming_convention-Project-kv-result = "${local.azurecaf_naming_convention-Project-kv-21}-kv"
}

//Can't have a "_" in the name, only "-"
resource "azurerm_key_vault" "Project-kv" {
  # name                            = azurecaf_naming_convention.Project-kv.result
  name                            = local.azurecaf_naming_convention-Project-kv-result
  location                        = azurerm_resource_group.Keyvault-rg.location
  resource_group_name             = azurerm_resource_group.Keyvault-rg.name
  sku_name                        = "standard"
  tenant_id                       = data.azurerm_client_config.current.tenant_id
  enabled_for_deployment          = true
  enabled_for_disk_encryption     = true
  enabled_for_template_deployment = true
  tags                            = var.tags
}

# azurerm_monitor_diagnostic_setting is required for PBMM-Guardrails

resource "azurerm_monitor_diagnostic_setting" "Project-kv-logs" {
  name                       = "${azurerm_key_vault.Project-kv.name}-logs"
  target_resource_id         = azurerm_key_vault.Project-kv.id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.Project-law.id

  log {
    category = "AuditEvent"
    enabled  = true

    retention_policy {
      enabled = true
      days    = 30
    }
  }

  metric {
    category = "AllMetrics"
    enabled  = true

    retention_policy {
      enabled = true
      days    = 30
    }
  }
}

# Keyvault RBAC

resource "azurerm_key_vault_access_policy" "L1_Subscription_Contributors_key_vault_access_policy" {
  key_vault_id = azurerm_key_vault.Project-kv.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = azuread_group.L1_Subscription_Contributors.id
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


resource "azurerm_key_vault_access_policy" "L2_Subscription_Contributors_key_vault_access_policy" {
  key_vault_id = azurerm_key_vault.Project-kv.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = azuread_group.L2_Subscription_Contributors.id
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
