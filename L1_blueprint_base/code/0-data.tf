data "azurerm_client_config" "current" {}

data "azurerm_subscription" "primary" {}

data "azuread_users" "L1_Subscription_Owners" {
  user_principal_names = var.L1_RBAC.ownerNames
}

data "azuread_users" "L1_Subscription_Contributors" {
  user_principal_names = var.L1_RBAC.contributorNames
}

data "azuread_users" "L1_Subscription_Readers" {
  user_principal_names = var.L1_RBAC.readerNames
}
