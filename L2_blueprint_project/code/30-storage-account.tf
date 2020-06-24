resource azurecaf_naming_convention Project-sa {
  name          = "${local.env_short}${local.group_short}${local.project_short}prj${local.unique_Logs}"
  resource_type = "st"
  convention    = "passthrough"
}

resource "azurerm_storage_account" "Project-sa" {
  name                     = azurecaf_naming_convention.Project-sa.result
  location                 = var.location
  resource_group_name      = azurerm_resource_group.Project-rg.name
  account_tier             = "Standard"
  account_kind             = "StorageV2"
  account_replication_type = "GRS"
  tags                     = var.tags
}
