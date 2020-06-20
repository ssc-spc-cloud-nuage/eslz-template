resource "azurerm_storage_account" "Project_law-sa" {
  #name                     = lower(substr("${var.env}${var.group}${var.project}${substr(sha1("${azurerm_resource_group.Logs-rg.id}"), 0, 8)}", 0, 24))
  name                     = "${lower(var.env)}${lower(var.group)}${lower(var.project)}law${local.unique}stg"
  location                 = azurerm_resource_group.Logs-rg.location
  resource_group_name      = azurerm_resource_group.Logs-rg.name
  account_tier             = "Standard"
  account_kind             = "StorageV2"
  account_replication_type = "GRS"
  tags                     = var.tags
}
