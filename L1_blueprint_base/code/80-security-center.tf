/*
resource "azurerm_security_center_contact" "contact" {
  count = var.deployOptionalFeatures.security_center ? 1 : 0
  email = var.optionalFeaturesConfig.security_center.email
  phone = var.optionalFeaturesConfig.security_center.phone

  alert_notifications = true
  alerts_to_admins    = true
}
*/

resource "azurerm_security_center_subscription_pricing" "sc" {
  count = var.deployOptionalFeatures.security_center ? 1 : 0
  tier  = "Standard"
}

resource "azurerm_security_center_workspace" "sc" {
  count        = var.deployOptionalFeatures.security_center ? 1 : 0
  scope        = data.azurerm_subscription.primary.id
  workspace_id = local.Project-law.id

  depends_on = [azurerm_security_center_subscription_pricing.sc]
}