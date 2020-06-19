resource "azuread_group" "Subscription_Owners" {
  name = "${local.prefix}_${var.project}_Subscription_Owners"
  owners = var.Subscription_AADGroup_Owners_ids
}

resource "azuread_group" "Subscription_Contributors" {
  name = "${local.prefix}_${var.project}_Subscription_Contributors"
  owners = var.Subscription_AADGroup_Owners_ids
}

resource "azuread_group" "Subscription_Readers" {
  name = "${local.prefix}_${var.project}_Subscription_Readers"
  owners = var.Subscription_AADGroup_Owners_ids
}