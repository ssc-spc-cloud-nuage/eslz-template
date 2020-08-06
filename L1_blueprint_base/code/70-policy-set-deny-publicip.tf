module Project-Deny-PublicIP-Policy {
  source                  = "github.com/canada-ca-terraform-modules/terraform-azurerm-caf-deny-publicip_policy_set?ref=v0.2.0"
  deploy                  = var.deployOptionalFeatures.deny_publicip_policy
  env                     = var.env
  userDefinedString       = local.prefix
  log_analytics_workspace = local.Project-law
}
/*
module Management-Deny-PublicIP-Policy {
  source                  = "github.com/canada-ca-terraform-modules/terraform-azurerm-caf-deny-publicip_policy_set?ref=v0.2.0"
  deploy                  = var.deployOptionalFeatures.deny_publicip_policy
  env                     = var.env
  userDefinedString       = local.prefix
  log_analytics_workspace = local.Project-law
  management_group_name   = "PBMM_VDC"
}
*/
locals {
  deny_publicip_policy_set_name = substr("${var.env}-${local.prefix} deny public ip policy set", 0, 64)
}

resource "azurerm_policy_assignment" "deny_publicip_policy_assignment" {
  count                = var.deployOptionalFeatures.deny_publicip_policy ? 1 : 0
  name                 = local.deny_publicip_policy_set_name
  location             = local.Project-law.location
  scope                = data.azurerm_subscription.primary.id
  policy_definition_id = module.Project-Deny-PublicIP-Policy.id
  display_name         = local.deny_publicip_policy_set_name
  description          = "Apply deny public ip settings on subscription for Azure for PBMM Guardrails compliance"
  identity {
    type = "SystemAssigned"
  }
}
