# Create a resource group

resource azurerm_resource_group AutomationAccount-rg {
  name     = "${local.prefix}_${var.project}_AutomationAccount-rg"
  location = var.location
  tags     = var.tags
}

resource azurerm_resource_group Backups-rg {
  name     = "${local.prefix}_${var.project}_Backups-rg"
  location = var.location
  tags     = var.tags
}

resource azurerm_resource_group Network-rg {
  name     = "${local.prefix}_${var.project}_Network-rg"
  location = var.location
  tags     = var.tags
}

resource azurerm_resource_group Keyvault-rg {
  name     = "${local.prefix}_${var.project}_Keyvault-rg"
  location = var.location
  tags     = var.tags
}

resource azurerm_resource_group Logs-rg {
  name     = "${local.prefix}_${var.project}_Logs-rg"
  location = var.location
  tags     = var.tags
}

resource azurerm_resource_group DNS-rg {
  name     = "${local.prefix}_${var.project}_DNS-rg"
  location = var.location
  tags     = var.tags
}

resource azurerm_resource_group Management-rg {
  name     = "${local.prefix}_${var.project}_Management-rg"
  location = var.location
  tags     = var.tags
}