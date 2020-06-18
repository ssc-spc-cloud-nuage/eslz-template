resource "azuread_group" "BYOD_Project_Contributors" {
  name = "${local.prefix}_BYOD-Contributors"
  owners = var.BYOD_AADGroup_Owners_ids
}

resource "azuread_group" "BYOD_Project_Readers" {
  name = "${local.prefix}_BYOD-Readers"
  owners = var.BYOD_AADGroup_Owners_ids
}

resource "azuread_group" "BYOD_Project_Admins" {
  name = "${local.prefix}_BYOD-Admins"
  owners = var.BYOD_AADGroup_Owners_ids
}

resource "azuread_group" "BYOD_Project_Maintainers" {
  name = "${local.prefix}_BYOD-Maintainers"
  owners = var.BYOD_AADGroup_Owners_ids
}

resource "azuread_group" "BYOD_Project_Stakeholders" {
  name = "${local.prefix}_BYOD-Stakeholders"
  owners = var.BYOD_AADGroup_Owners_ids
}