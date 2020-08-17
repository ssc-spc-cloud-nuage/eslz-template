/*
  Example structure for azuread_groups map

  azuread_groupsMap = {
    L1_Subscription_Owners = {
      userDefinedString = "${var.group}_${var.project}_L1_Subscription_Owners"
      owners            = var.L1_RBAC.ownerNames
    },
    L1_Subscription_Contributors = {
      userDefinedString = "${var.group}_${var.project}_L1_Subscription_Contributors"
      owners            = var.L1_RBAC.ownerNames
    },
  }
  */

locals {
  azuread_groupsMap = {
    L1_Subscription_Owners = {
      userDefinedString = "${var.group}_${var.project}_L1_Subscription_Owners"
      owners            = var.L1_RBAC.ownerNames
    },
    L1_Subscription_Contributors = {
      userDefinedString = "${var.group}_${var.project}_L1_Subscription_Contributors"
      owners            = var.L1_RBAC.ownerNames
    },
    L1_Subscription_Readers = {
      userDefinedString = "${var.group}_${var.project}_L1_Subscription_Readers"
      owners            = var.L1_RBAC.ownerNames
    },
    L2_Subscription_Owners = {
      userDefinedString = "${var.group}_${var.project}_L2_Subscription_Owners"
      owners            = var.L1_RBAC.ownerNames
    },
    L2_Subscription_Contributors = {
      userDefinedString = "${var.group}_${var.project}_L2_Subscription_Contributors"
      owners            = var.L1_RBAC.ownerNames
    },
    L2_Subscription_Readers = {
      userDefinedString = "${var.group}_${var.project}_L2_Subscription_Readers"
      owners            = var.L1_RBAC.ownerNames
    },
  }
}

module azuread_groups_L1 {
  source = "github.com/canada-ca-terraform-modules/terraform-azuread-caf-azuread_group?ref=v1.1.0"
  for_each = local.azuread_groupsMap

  env    = var.env
  userDefinedString = each.value.userDefinedString
  owners = each.value.owners
}

locals {
  azuread_groups_L1 = module.azuread_groups_L1
}
