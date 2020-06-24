resource azurecaf_naming_convention Project_law-sa {  
  name    = "${lower(var.env)}${lower(var.group)}${lower(substr(var.project, 0, 4))}law${local.unique_Logs}stg"
  resource_type    = "st"
  convention  = "passthrough"
}

resource "azurerm_storage_account" "Project_law-sa" {
  name                     = azurecaf_naming_convention.Project_law-sa.result
  location                 = azurerm_resource_group.Logs-rg.location
  resource_group_name      = azurerm_resource_group.Logs-rg.name
  account_tier             = "Standard"
  account_kind             = "StorageV2"
  account_replication_type = "GRS"
  tags                     = var.tags
}
