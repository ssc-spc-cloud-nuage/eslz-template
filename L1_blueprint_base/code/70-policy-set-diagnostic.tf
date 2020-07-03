module Project-Diagnostic-Policy {
  source                  = "github.com/canada-ca-terraform-modules/terraform-azurerm-caf-diagnostic_policy_set?ref=v0.1.5"
  deploy                  = var.deployOptionalFeatures.diagnostics_policy
  env                     = var.env
  userDefinedString       = local.prefix
  log_analytics_workspace = local.Project-law
}
