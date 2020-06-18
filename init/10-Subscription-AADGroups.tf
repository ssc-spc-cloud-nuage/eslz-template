resource "azuread_group" "Subscription_Contributors" {
  name = "${local.prefix}-Contributors"
  owners = var.Subscription_AADGroup_Owners_ids
}