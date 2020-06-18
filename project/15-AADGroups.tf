data "azuread_group" "Project_Contributors" {
  name = "${local.prefix}_${var.project}-Contributors"
}

data "azuread_users" "Contributors" {
  user_principal_names = var.contributorNames
}

resource "azuread_group_member" "Project-Contributors-Members" {
  for_each = toset(data.azuread_users.Contributors.object_ids)

  group_object_id  = data.azuread_group.Project_Contributors.id
  member_object_id = each.key
}

# Give access to SP (Enterprise App) to be able to manage resources via AAD group membership
resource "azuread_group_member" "Project-SP-Contributors-Members" {
  for_each = toset(var.contributorEnterpriseID)

  group_object_id  = data.azuread_group.Project_Contributors.id
  member_object_id = each.key
}

data "azuread_group" "Project_Readers" {
  name = "${local.prefix}_${var.project}-Readers"
}

data "azuread_users" "Readers" {
  user_principal_names = var.readerNames
}

resource "azuread_group_member" "Project-Readers-Members" {
  for_each = toset(data.azuread_users.Readers.object_ids)

  group_object_id  = data.azuread_group.Project_Readers.id
  member_object_id = each.key
}
