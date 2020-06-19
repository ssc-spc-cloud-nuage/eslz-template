data "azurerm_client_config" "current" {}

data "azurerm_dns_zone" "zone1" {
  name = "${var.domain}"
}

data "azurerm_resource_group" "DNS-rg" {
  name = "${local.prefix}_DNS-rg"
}

data "azurerm_subnet" "Project_PAZ-snet" {
  name                 = "${var.env}CNR-${var.group}-${var.project}_PAZ-snet"
  virtual_network_name = "${var.env}CNR-${var.group}-vnet"
  resource_group_name  = "${local.prefix}_Network-rg"
}

data "azurerm_subnet" "Project_OZ-snet" {
  name                 = "${var.env}CNR-${var.group}-${var.project}_OZ-snet"
  virtual_network_name = "${var.env}CNR-${var.group}-vnet"
  resource_group_name  = "${local.prefix}_Network-rg"
}

data "azurerm_subnet" "Project_RZ-snet" {
  name                 = "${var.env}CNR-${var.group}-${var.project}_RZ-snet"
  virtual_network_name = "${var.env}CNR-${var.group}-vnet"
  resource_group_name  = "${local.prefix}_Network-rg"
}

data azurerm_log_analytics_workspace Project-law {
  name = var.logAnalyticsWorkspaceName
  resource_group_name = var.logAnalyticsWorkspaceResourceGroupName
}

data azurerm_resource_group Keyvault-rg {
  name = "${local.prefix}_${var.project}_Keyvault-rg"
}

data azurerm_key_vault Project-kv {
  name                = "${substr("${var.env}CKV-${var.group}-${var.project}-${substr(sha1("${data.azurerm_resource_group.Keyvault-rg.id}"), 0, 8)}", 0, 21)}-kv"
  resource_group_name = data.azurerm_resource_group.Keyvault-rg.name
}