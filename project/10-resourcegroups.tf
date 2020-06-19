# Create a resource group

resource "azurerm_resource_group" "Project-rg" {
  name     = "${local.prefix}_${var.project}_Project-rg"
  location = var.location
  tags     = var.tags
}
