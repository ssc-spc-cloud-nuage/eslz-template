data "azurerm_client_config" "current" {}

data "azurerm_dns_zone" "zone1" {
  name = "${var.domain.public.name}"
}

data "azurerm_subnet" "Project_PAZ-snet" {
  name                 = "${var.env}CNR-${var.group}_${var.project}_PAZ-snet"
  virtual_network_name = "${var.env}CNR-${var.group}_${var.project}-vnet"
  resource_group_name  = data.azurerm_resource_group.Network-rg.name
}

data "azurerm_subnet" "Project_OZ-snet" {
  name                 = "${var.env}CNR-${var.group}_${var.project}_OZ-snet"
  virtual_network_name = "${var.env}CNR-${var.group}_${var.project}-vnet"
  resource_group_name  = data.azurerm_resource_group.Network-rg.name
}

data "azurerm_subnet" "Project_RZ-snet" {
  name                 = "${var.env}CNR-${var.group}_${var.project}_RZ-snet"
  virtual_network_name = "${var.env}CNR-${var.group}_${var.project}-vnet"
  resource_group_name  = data.azurerm_resource_group.Network-rg.name
}

data azurerm_log_analytics_workspace Project-law {
  name                = "${var.env}CLD-${var.group}-${var.project}-Project-law"
  resource_group_name = data.azurerm_resource_group.Logs-rg.name
}

data azurerm_storage_account Project_law-sa {
  name                = "${lower(var.env)}${lower(var.group)}${lower(var.project)}law${local.unique_Logs}stg"
  resource_group_name = data.azurerm_resource_group.Logs-rg.name
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

data azurerm_key_vault Project-kv {
  name                = "${substr("${var.env}CKV-${var.group}-${var.project}-${substr(sha1("${data.azurerm_resource_group.Keyvault-rg.id}"), 0, 8)}", 0, 21)}-kv"
  resource_group_name = data.azurerm_resource_group.Keyvault-rg.name
}