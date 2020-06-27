locals {
  unique_Logs     = substr(sha1(local.resource_groups.Logs-rg.id), 0, 8)
  unique_Keyvault = substr(sha1(local.resource_groups.Keyvault-rg.id), 0, 8)
  prefix          = "${var.env}-${var.group}"
  env_short       = substr(var.env, 0, 4)
  group_short     = substr(var.group, 0, 4)
  project_short   = substr(var.project, 0, 4)
}
