module Project_ddos_protection_plan {
  source            = "github.com/canada-ca-terraform-modules/terraform-azurerm-caf-network_ddos_protection_plan?ref=v1.0.0"
  deploy            = var.deployOptionalFeatures.ddos_protection_plan ? true : false
  env               = var.env
  userDefinedString = "${var.group}_${var.project}"
  resource_group    = local.resource_groups_L1.Network
  tags              = var.tags
}