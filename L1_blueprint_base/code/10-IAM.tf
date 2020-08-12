resource "azurerm_role_assignment" "L1_Subscription_Owners" {
  scope                = data.azurerm_subscription.primary.id
  role_definition_name = "Owner"
  principal_id         = local.azuread_groups_L1.L1_Subscription_Owners.id
}

resource "azurerm_role_assignment" "L1_Subscription_Contributors" {
  scope                = data.azurerm_subscription.primary.id
  role_definition_name = "Contributor"
  principal_id         = local.azuread_groups_L1.L1_Subscription_Contributors.id
}

resource "azurerm_role_assignment" "L1_Subscription_Readers" {
  scope                = data.azurerm_subscription.primary.id
  role_definition_name = "Reader"
  principal_id         = local.azuread_groups_L1.L1_Subscription_Readers.id
}

resource "azurerm_role_assignment" "L2_Subscription_Owners" {
  scope                = data.azurerm_subscription.primary.id
  role_definition_name = "Owner"
  principal_id         = local.azuread_groups_L1.L2_Subscription_Owners.id
}

resource "azurerm_role_assignment" "L2_Subscription_Contributors" {
  scope                = data.azurerm_subscription.primary.id
  role_definition_name = "Contributor"
  principal_id         = local.azuread_groups_L1.L2_Subscription_Contributors.id
}

resource "azurerm_role_assignment" "L2_Subscription_Readers" {
  scope                = data.azurerm_subscription.primary.id
  role_definition_name = "Reader"
  principal_id         = local.azuread_groups_L1.L2_Subscription_Readers.id
}

resource "azurerm_role_assignment" "launchpad_storage_blob_contributor_owners" {
  scope                = local.L0_resource_groups.tfstate.id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = local.azuread_groups_L1.L1_Subscription_Owners.id
}

resource "azurerm_role_assignment" "launchpad_storage_blob_contributor_contributors" {
  scope                = local.L0_resource_groups.tfstate.id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = local.azuread_groups_L1.L1_Subscription_Contributors.id
}

resource "azurerm_key_vault_access_policy" "keyvault_access_policy_L1_owners" {
  for_each = local.L0_keyvaults

  key_vault_id = each.value.id

  tenant_id = data.azurerm_client_config.current.tenant_id
  object_id = local.azuread_groups_L1.L1_Subscription_Owners.id

  key_permissions    = []
  secret_permissions = ["Get", "List", "Set", "Delete"]
}

resource "azurerm_key_vault_access_policy" "keyvault_access_policy_L1_contributors" {
  for_each = local.L0_keyvaults

  key_vault_id = each.value.id

  tenant_id = data.azurerm_client_config.current.tenant_id
  object_id = local.azuread_groups_L1.L1_Subscription_Contributors.id

  secret_permissions = ["Get", "List", "Set", "Delete"]
}
