module Project_law-sa {
  source                   = "github.com/canada-ca-terraform-modules/terraform-azurerm-caf-storage_account?ref=v1.0.3"
  env                      = var.env
  userDefinedString        = "law${var.project}"
  resource_group           = local.resource_groups_L1.Logs
  account_tier             = "Standard"
  account_kind             = "StorageV2"
  account_replication_type = "GRS"
  allow_blob_public_access = false
  tags                     = var.tags
}

locals {
  Project_law-sa = module.Project_law-sa.object
}
