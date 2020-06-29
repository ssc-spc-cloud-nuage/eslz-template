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