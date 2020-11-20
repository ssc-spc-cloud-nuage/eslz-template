module "Project-sa" {
  source                   = "github.com/canada-ca-terraform-modules/terraform-azurerm-caf-storage_account?ref=v1.0.3"
  env                      = var.env
  userDefinedString        = "main${var.project}"
  resource_group           = local.resource_groups_L2.Project
  account_tier             = "Standard"
  account_kind             = "StorageV2"
  account_replication_type = "GRS"
  allow_blob_public_access = false
  tags                     = var.tags
}
