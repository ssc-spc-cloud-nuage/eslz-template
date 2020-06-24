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

data azurerm_subnet Project_MAZ-snet {
  name                 = "${var.env}CNR-${var.group}_${var.project}_MAZ-snet"
  virtual_network_name = "${var.env}CNR-${var.group}_${var.project}-vnet"
  resource_group_name  = data.azurerm_resource_group.Network-rg.name
}

/*
resource azurecaf_naming_convention Project-law {  
  name    = "${var.env}CLD-${var.group}-${var.project}-${local.unique_Logs}"
  resource_type    = "la"
  postfix = "law"
  convention  = "passthrough"
}
*/

locals {
  azurecaf_naming_convention-Project-law-replace = replace("${var.env}CLD-${var.group}-${var.project}", "_", "-")
  azurecaf_naming_convention-Project-law-regex  = regex("[0-9A-Za-z-]+", local.azurecaf_naming_convention-Project-law-replace)
  azurecaf_naming_convention-Project-law-54     = substr(local.azurecaf_naming_convention-Project-law-regex, 0, 54)
  azurecaf_naming_convention-Project-law-59     = substr("${local.azurecaf_naming_convention-Project-law-54}-${local.unique_Logs}", 0, 59)
  azurecaf_naming_convention-Project-law-result = "${local.azurecaf_naming_convention-Project-law-59}-law"
}

data azurerm_log_analytics_workspace Project-law {
  name                = local.azurecaf_naming_convention-Project-law-result
  resource_group_name = data.azurerm_resource_group.Logs-rg.name
}

resource azurecaf_naming_convention Project_law-sa {  
  name    = "${local.env_short}${local.group_short}${local.project_short}law${local.unique_Logs}"
  resource_type    = "st"
  convention  = "passthrough"
}

data azurerm_storage_account Project_law-sa {
  name                = azurecaf_naming_convention.Project_law-sa.result
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

resource azurecaf_naming_convention Project-kv {  
  name    = "${substr("${var.env}CKV-${var.group}-${substr(var.project, 0, 4)}-${local.unique_Keyvault}", 0, 21)}-kv"
  resource_type    = "kv"
  convention  = "passthrough"
}

data azurerm_key_vault Project-kv {
  name                = azurecaf_naming_convention.Project-kv.result
  resource_group_name = data.azurerm_resource_group.Keyvault-rg.name
}