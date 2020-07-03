module resource_groups_L2 {
  source = "github.com/canada-ca-terraform-modules/terraform-azurerm-caf-resource_groups?ref=v1.0.0"
  resource_groups = {
    Project = { userDefinedString = "${local.userDefinedStringPrefix}_Project" },
  }
  env      = var.env
  location = var.location
  tags     = var.tags
}

locals {
  resource_groups_L2 = module.resource_groups_L2.object
}