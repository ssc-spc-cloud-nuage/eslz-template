module "Project-sa" {
  source                   = "github.com/canada-ca-terraform-modules/terraform-azurerm-caf-storage_account?ref=v1.0.1"
  env                      = var.env
  userDefinedString        = "main${var.project}"
  resource_group           = azurerm_resource_group.Project-rg
  account_tier             = "Standard"
  account_kind             = "StorageV2"
  account_replication_type = "GRS"
  tags                     = var.tags
}