# This section will add owners to the subscription. Any user that will need to deploy using
# CAF need to be a member of this L1_Subscription_Owners group. Also, this group will be made member if the caf-level0-rover-developers
# AAD Security group such that they can access the launchpad resources to get to the base and work on projects ;-)
#
# We use the launchpad local0.tfvars prefix value for this.

resource "azuread_group_member" "L1_Subscription_Owners-Members" {
  for_each = toset(data.azuread_users.L1_Subscription_Owners.object_ids)

  group_object_id  = local.azuread_groups_L1.L1_Subscription_Owners.id
  member_object_id = each.key
}

resource "azuread_group_member" "L1_Subscription_Contributors-Members" {
  for_each = toset(data.azuread_users.L1_Subscription_Contributors.object_ids)

  group_object_id  = local.azuread_groups_L1.L1_Subscription_Contributors.id
  member_object_id = each.key
}

resource "azuread_group_member" "L1_Subscription_Readers-Members" {
  for_each = toset(data.azuread_users.L1_Subscription_Readers.object_ids)

  group_object_id  = local.azuread_groups_L1.L1_Subscription_Readers.id
  member_object_id = each.key
}

# Add the L1_Subscription_Owners AAD Security group as a member of caf-level0-rover-developers (also assigned to Subscription Owner role)
/*
resource "azuread_group_member" "caf-level0-rover-developers-Members" {
  group_object_id  = data.azuread_group.caf-level0-rover-developers.id
  member_object_id = local.azuread_groups_L1.L1_Subscription_Owners.id
}
*/