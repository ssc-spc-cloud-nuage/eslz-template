# Can't use azurecaf_naming_convention for now due to casing bug https://github.com/aztfmod/terraform-provider-azurecaf/issues/25
# Will use when bug is fixed

module "Project-law" {
  source            = "github.com/canada-ca-terraform-modules/terraform-azurerm-caf-log_analytics_workspace?ref=v1.0.2"
  userDefinedString = "${var.group}_${var.project}"
  resource_group    = local.resource_groups_L1.Logs
  env               = var.env
  tags              = var.tags

  solution_plan_map = {
    ServiceMap = {
      publisher = "Microsoft"
      product   = "OMSGallery/ServiceMap"
    },
    AzureActivity = {
      publisher = "Microsoft"
      product   = "OMSGallery/AzureActivity"
    },
    AgentHealthAssessment = {
      "publisher" = "Microsoft"
      "product"   = "OMSGallery/AgentHealthAssessment"
    },
    DnsAnalytics = {
      "publisher" = "Microsoft"
      "product"   = "OMSGallery/DnsAnalytics"
    },
    KeyVaultAnalytics = {
      "publisher" = "Microsoft"
      "product"   = "OMSGallery/KeyVaultAnalytics"
    },
    Updates = {
      "publisher" = "Microsoft"
      "product"   = "OMSGallery/Updates"
    },
    ChangeTracking = {
      "publisher" = "Microsoft"
      "product"   = "OMSGallery/ChangeTracking"
    }
  }

  datasource_windows_event_map = {
    windows_Application_event = {
      event_log_name = "Application"
      event_types    = ["error", "warning"]
    },
    windows_System_event = {
      event_log_name = "System"
      event_types    = ["error", "warning"]
    }
  }
}

locals {
  Project-law = module.Project-law.object
}