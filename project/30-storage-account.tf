resource "azurerm_storage_account" "Project-sa" {
  name                     = "${lower(var.env)}csa${lower(var.project)}${lower(var.group)}${local.unique}stg"
  location                 = var.location
  resource_group_name      = azurerm_resource_group.Project-rg.name
  account_tier             = "Standard"
  account_kind             = "StorageV2"
  account_replication_type = "GRS"
  tags                     = var.tags
}
