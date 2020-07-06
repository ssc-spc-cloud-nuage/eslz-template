module Project-Deny-PublicIP-Policy {
  source                  = "github.com/canada-ca-terraform-modules/terraform-azurerm-caf-deny-publicip_policy_set?ref=v0.1.0"
  deploy                  = var.deployOptionalFeatures.deny_publicip_policy
  env                     = var.env
  userDefinedString       = local.prefix
  log_analytics_workspace = local.Project-law
}
