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

data "azurerm_resource_group" "Project-rg" {
  name = "${var.env}-${var.group}_${var.project}-rg"
}