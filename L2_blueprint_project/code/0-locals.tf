locals {
  unique      = substr(sha1(azurerm_resource_group.Project-rg.id), 0, 3)
  unique_Logs = substr(sha1(data.azurerm_resource_group.Logs-rg.id), 0, 3)
  prefix      = "${var.env}-${var.group}"
}
