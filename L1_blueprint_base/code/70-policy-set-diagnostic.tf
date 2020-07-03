module Project-Diagnostic-Policy {
  source                  = "github.com/canada-ca-terraform-modules/terraform-azurerm-caf-diagnostic_policy_set?ref=v0.1.4"
  env                     = var.env
  userDefinedString       = local.prefix
  log_analytics_workspace = local.Project-law
}
