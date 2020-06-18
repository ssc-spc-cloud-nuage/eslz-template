resource "azuread_group" "EBAP_Project_Contributors" {
  name = "${local.prefix}-EBAP-Contributors"
  owners = var.EBAP_AADGroup_Owners_ids
}

resource "azuread_group" "EBAP_Project_Readers" {
  name = "${local.prefix}-EBAP-Readers"
  owners = var.EBAP_AADGroup_Owners_ids
}