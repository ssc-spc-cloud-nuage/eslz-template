resource "azurerm_role_assignment" "L1_Subscription_Owners" {
  scope                = data.azurerm_subscription.primary.id
  role_definition_name = "Owner"
  principal_id         = azuread_group.L1_Subscription_Contributors.id
}

resource "azurerm_role_assignment" "L1_Subscription_Contributors" {
  scope                = data.azurerm_subscription.primary.id
  role_definition_name = "Contributor"
  principal_id         = azuread_group.L1_Subscription_Contributors.id
}

resource "azurerm_role_assignment" "L1_Subscription_Readers" {
  scope                = data.azurerm_subscription.primary.id
  role_definition_name = "Reader"
  principal_id         = azuread_group.L1_Subscription_Readers.id
}

resource "azurerm_role_assignment" "L2_Subscription_Owners" {
  scope                = data.azurerm_subscription.primary.id
  role_definition_name = "Owner"
  principal_id         = azuread_group.L2_Subscription_Contributors.id
}

resource "azurerm_role_assignment" "L2_Subscription_Contributors" {
  scope                = data.azurerm_subscription.primary.id
  role_definition_name = "Contributor"
  principal_id         = azuread_group.L2_Subscription_Contributors.id
}

resource "azurerm_role_assignment" "L2_Subscription_Readers" {
  scope                = data.azurerm_subscription.primary.id
  role_definition_name = "Reader"
  principal_id         = azuread_group.L2_Subscription_Readers.id
}