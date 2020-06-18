# Create a resource group

resource "azurerm_resource_group" "AutomationAccount-rg" {
  name     = "${local.prefix}_AutomationAccount-rg"
  location = var.location
  tags     = var.tags
}

resource "azurerm_resource_group" "Network-rg" {
  name     = "${local.prefix}_Network-rg"
  location = var.location
  tags     = var.tags
}

resource "azurerm_resource_group" "Keyvault-rg" {
  name     = "${local.prefix}_Keyvault-rg"
  location = var.location
  tags     = var.tags
}

resource "azurerm_resource_group" "Logs-rg" {
  name     = "${local.prefix}_Logs-rg"
  location = var.location
  tags     = var.tags
}

resource "azurerm_resource_group" "DNS-rg" {
  name     = "${local.prefix}_DNS-rg"
  location = var.location
  tags     = var.tags
}

resource "azurerm_resource_group" "MGMT_Servers-rg" {
  name     = "${local.prefix}_MGMT_Servers-rg"
  location = var.location
  tags     = var.tags
}