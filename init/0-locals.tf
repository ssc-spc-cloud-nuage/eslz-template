locals {
  prefix      = "${var.env}-${var.group}"
  unique      = substr(sha1(azurerm_resource_group.Storage-rg.id), 0, 3)
  storageName = lower("${var.env}${var.group}csaterra${local.unique}stg")
}
