locals {
  rglist = {
    Project = { userDefinedString = "${local.userDefinedStringPrefix}_Project" },
  }
}

module resource_groups_L2 {
  source = "github.com/canada-ca-terraform-modules/terraform-azurerm-caf-resource_groups?ref=v1.1.0"
  for_each = local.rglist

  userDefinedString = each.value.userDefinedString
  env = var.env
  location = lookup(each.value, "location", var.location)
  tags     = merge(lookup(each.value, "tags", {}), var.tags)
}

locals {
  resource_groups_L2 = module.resource_groups_L2
}