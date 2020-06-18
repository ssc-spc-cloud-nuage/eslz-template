resource "azuread_group" "Core-Contributors" {
  name = "${local.prefix}_Core-Contributors"
}

data "azuread_users" "Contributors" {
  user_principal_names = var.contributorNames
}

resource "azuread_group_member" "Core-Contributors-Members" {
  for_each = toset(data.azuread_users.Contributors.object_ids)

  group_object_id  = azuread_group.Core-Contributors.id
  member_object_id = each.key
}

# Give access to SP (Enterprise App) to be able to manage resources via AAD group membership
resource "azuread_group_member" "Core-SP-Contributors-Members" {
  for_each = toset(var.contributorEnterpriseID)

  group_object_id  = azuread_group.Core-Contributors.id
  member_object_id = each.key
}

//Group for keyvault
resource "azuread_group" "KeyVault-Access" {
  name = "${local.prefix}_KeyVault-Access"
}

resource "azuread_group_member" "KeyVault-Access-Members" {
  for_each = toset(data.azuread_users.Contributors.object_ids)

  group_object_id  = azuread_group.KeyVault-Access.id
  member_object_id = each.key
}