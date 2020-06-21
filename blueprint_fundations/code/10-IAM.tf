resource "azurerm_role_assignment" "Subscription_Owners" {
  scope                = data.azurerm_subscription.primary.id
  role_definition_name = "Owner"
  principal_id         = azuread_group.Subscription_Contributors.id
}

resource "azurerm_role_assignment" "Subscription_Contributors" {
  scope                = data.azurerm_subscription.primary.id
  role_definition_name = "Contributor"
  principal_id         = azuread_group.Subscription_Contributors.id
}

resource "azurerm_role_assignment" "Subscription_Readers" {
  scope                = data.azurerm_subscription.primary.id
  role_definition_name = "Contributor"
  principal_id         = azuread_group.Subscription_Readers.id
}