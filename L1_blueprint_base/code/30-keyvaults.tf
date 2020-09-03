/*
locals {
  azurecaf_naming_convention-Project-kv-16     = substr("${local.env_short}CKV-${local.group_short}-${local.project_short}", 0, 16)
  azurecaf_naming_convention-Project-kv-21     = substr("${local.azurecaf_naming_convention-Project-kv-16}-${local.unique_Keyvault}", 0, 21)
  azurecaf_naming_convention-Project-kv-result = "${local.azurecaf_naming_convention-Project-kv-21}-kv"
}

//Can't have a "_" in the name, only "-"
resource "azurerm_key_vault" "Project-kv" {
  # name                            = azurecaf_naming_convention.Project-kv.result
  name                            = local.azurecaf_naming_convention-Project-kv-result
  location                        = local.resource_groups_L1.Keyvault.location
  resource_group_name             = local.resource_groups_L1.Keyvault.name
  sku_name                        = "standard"
  tenant_id                       = data.azurerm_client_config.current.tenant_id
  enabled_for_deployment          = true
  enabled_for_disk_encryption     = true
  enabled_for_template_deployment = true
  tags                            = var.tags
}
*/

module Project-kv {
  source            = "github.com/canada-ca-terraform-modules/terraform-azurerm-caf-keyvault?ref=dev"
  env               = var.env
  userDefinedString = "${local.group_short}-${local.project_short}"
  resource_group    = local.resource_groups_L1.Keyvault
  akv_config = {
    #akv_features is optional
    akv_features = {
      enabled_for_disk_encryption     = true
      enabled_for_deployment          = true
      enabled_for_template_deployment = true
      soft_delete_enabled             = true
      purge_protection_enabled        = true
    }

    sku_name = "standard"

    #network_acls is optional
    network_acls = {
      # bypass = "AzureServices"
      # default_action = "Deny"
    }
  }
  tags = var.tags
}

locals {
  Project-kv = module.Project-kv.object
}

# azurerm_monitor_diagnostic_setting is required for PBMM-Guardrails
/*
resource "azurerm_monitor_diagnostic_setting" "Project-kv-logs" {
  name                       = "${local.Project-kv.name}-logs"
  target_resource_id         = local.Project-kv.id
  log_analytics_workspace_id = local.Project-law.id

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
*/
# Keyvault RBAC

resource "azurerm_key_vault_access_policy" "L1_Subscription_Contributors_key_vault_access_policy" {
  key_vault_id = local.Project-kv.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = local.azuread_groups_L1.L1_Subscription_Contributors.id
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
  key_vault_id = local.Project-kv.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = local.azuread_groups_L1.L2_Subscription_Contributors.id
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

resource "azurerm_key_vault_access_policy" "L1_Subscription_Owners_key_vault_access_policy" {
  key_vault_id = local.Project-kv.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = local.azuread_groups_L1.L1_Subscription_Owners.id
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

resource "azurerm_key_vault_access_policy" "L2_Subscription_Owners_key_vault_access_policy" {
  key_vault_id = local.Project-kv.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = local.azuread_groups_L1.L2_Subscription_Owners.id
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
