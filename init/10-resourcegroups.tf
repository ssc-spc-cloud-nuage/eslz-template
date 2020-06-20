# Create resource group for terraform state storage and other

resource "azurerm_resource_group" "Storage-rg" {
  name     = "${local.prefix}_${var.project}_Storage-rg"
  location = var.location
  tags     = var.tags
}