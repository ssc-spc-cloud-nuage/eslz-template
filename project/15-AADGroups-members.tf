data "azuread_group" "Subscription_Contributors" {
  name = "${local.prefix}_${var.project}_Subscription_Contributors"
}

data "azuread_users" "Subscription_Contributors" {
  user_principal_names = var.contributorNames
}

resource "azuread_group_member" "Subscription_Contributors-Members" {
  for_each = toset(data.azuread_users.Subscription_Contributors.object_ids)

  group_object_id  = data.azuread_group.Subscription_Contributors.id
  member_object_id = each.key
}

# Give access to SP (Enterprise App) to be able to manage resources via AAD group membership
resource "azuread_group_member" "SP_Subscription_Contributors-Members" {
  for_each = toset(var.contributorEnterpriseID)

  group_object_id  = data.azuread_group.Subscription_Contributors.id
  member_object_id = each.key
}

data "azuread_group" "Subscription_Readers" {
  name = "${local.prefix}_${var.project}_Subscription_Readers"
}

data "azuread_users" "Subscription_Readers" {
  user_principal_names = var.readerNames
}

resource "azuread_group_member" "Subscription_Readers-Members" {
  for_each = toset(data.azuread_users.Subscription_Readers.object_ids)

  group_object_id  = data.azuread_group.Subscription_Readers.id
  member_object_id = each.key
}
