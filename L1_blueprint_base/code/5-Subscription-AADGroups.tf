resource "azuread_group" "L1_Subscription_Owners" {
  name = "${local.prefix}_${var.project}_L1_Subscription_Owners"
  owners = data.azuread_users.L1_Subscription_Owners.object_ids
}

resource "azuread_group" "L1_Subscription_Contributors" {
  name   = "${local.prefix}_${var.project}_L1_Subscription_Contributors"
  owners = data.azuread_users.L1_Subscription_Owners.object_ids
}

resource "azuread_group" "L1_Subscription_Readers" {
  name   = "${local.prefix}_${var.project}_L1_Subscription_Readers"
  owners = data.azuread_users.L1_Subscription_Owners.object_ids
}

resource "azuread_group" "L2_Subscription_Owners" {
  name   = "${local.prefix}_${var.project}_L2_Subscription_Owners"
  owners = data.azuread_users.L1_Subscription_Owners.object_ids
}

resource "azuread_group" "L2_Subscription_Contributors" {
  name   = "${local.prefix}_${var.project}_L2_Subscription_Contributors"
  owners = data.azuread_users.L1_Subscription_Owners.object_ids
}

resource "azuread_group" "L2_Subscription_Readers" {
  name   = "${local.prefix}_${var.project}_L2_Subscription_Readers"
  owners = data.azuread_users.L1_Subscription_Owners.object_ids
}