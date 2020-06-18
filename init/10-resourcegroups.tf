# Create resource group for terraform state storage and other

resource "azurerm_resource_group" "Storage-rg" {
  name     = "${local.prefix}_${var.project}_Storage-rg"
  location = var.location
  tags     = var.tags
}
/*
# Project
resource "azurerm_resource_group" "Project-rg" {
  name     = "${local.prefix}_${var.project}-rg"
  location = var.location
  tags     = var.tags
  lifecycle {
    prevent_destroy = false
  }
}

resource "azurerm_role_assignment" "Project-Contributors" {
  scope                = azurerm_resource_group.Project-rg.id
  role_definition_name = "Contributor"
  principal_id         = data.azuread_group.Project_Contributors_group.id
}
*/
