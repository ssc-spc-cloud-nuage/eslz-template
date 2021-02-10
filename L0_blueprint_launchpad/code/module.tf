
module "L0_Launchpad" {
  # source = "github.com/canada-ca-terraform-modules/terraform-azurerm-caf-l0-launchpad?ref=v1.0.0"
  source = "github.com/canada-ca-terraform-modules/terraform-azurerm-caf-l0-launchpad?ref=v1.1.1"
  launchpad_mode = var.launchpad_mode
  level = var.level
  convention = var.convention
  location = var.location
  prefix = var.prefix
  tf_name = var.tf_name
  resource_groups = var.resource_groups
  storage_account_name = var.storage_account_name
  keyvaults = var.keyvaults
  subscriptions = var.subscriptions
  aad_apps = var.aad_apps
  launchpad_key_names = var.launchpad_key_names
  custom_role_definitions = var.custom_role_definitions
  tags = var.tags
  rover_version = var.rover_version
  user_type = var.user_type
  logged_user_objectId = var.logged_user_objectId
  aad_users = var.aad_users
  aad_roles = var.aad_roles
  aad_api_permissions = var.aad_api_permissions
  environment = var.environment
  env = var.env
  group = var.group
  project = var.project
}
