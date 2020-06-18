resource "azurerm_storage_account" "storage" {
  name                     = local.storageName
  resource_group_name      = azurerm_resource_group.Storage-rg.name
  location                 = azurerm_resource_group.Storage-rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags                     = var.tags
  lifecycle {
    prevent_destroy = true
  }
}

resource "azurerm_storage_container" "state" {
  name                  = lower("${var.env}-${var.group}-${var.project}-tfstate")
  storage_account_name  = azurerm_storage_account.storage.name
  container_access_type = "private"
}