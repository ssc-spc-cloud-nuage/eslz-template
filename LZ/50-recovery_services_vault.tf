// Recovery Service Vault name must be 2 - 50 characters long, start with a letter, contain only letters, numbers and hyphens.
resource "azurerm_recovery_services_vault" "Project-rv" {
  count               = var.deployOptionalFeatures.recovery_services_vault ? 1 : 0
  name                = "${var.env}CNR-${var.group}-${var.project}-rv"
  location            = azurerm_resource_group.Backups-rg.location
  resource_group_name = azurerm_resource_group.Backups-rg.name
  sku                 = try(var.optionalFeaturesConfig.recovery_services_vault.sku, "Standard")
  soft_delete_enabled = try(var.optionalFeaturesConfig.recovery_services_vault.soft_delete_enabled, true)
  tags                = var.tags
}
