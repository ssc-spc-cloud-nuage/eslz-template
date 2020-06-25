data "azurerm_client_config" "current" {}

data "azurerm_dns_zone" "zone1" {
  name = "${var.domain.public.name}"
}

data azurerm_resource_group DNS-rg {
  name = "${local.prefix}_${var.project}_DNS-rg"
}

data azurerm_resource_group Keyvault-rg {
  name = "${local.prefix}_${var.project}_Keyvault-rg"
}

data azurerm_resource_group Logs-rg {
  name = "${local.prefix}_${var.project}_Logs-rg"
}

data azurerm_resource_group Management-rg {
  name = "${local.prefix}_${var.project}_Management-rg"
}

data azurerm_resource_group Network-rg {
  name = "${local.prefix}_${var.project}_Network-rg"
}
