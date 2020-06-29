locals {
  unique_Logs                   = substr(sha1(local.resource_groups_L1.Logs.id), 0, 8)
  unique_Keyvault               = substr(sha1(local.resource_groups_L1.Keyvault.id), 0, 8)
  prefix                        = "${var.env}-${var.group}"
  userDefinedStringPrefix       = "${var.group}_${var.project}"
  env_short                     = substr(var.env, 0, 4)
  group_short                   = substr(var.group, 0, 4)
  project_short                 = substr(var.project, 0, 4)
  userDefinedStringPrefix_short = "${local.group_short}_${local.project_short}"
  prefix_short                  = "${local.env_short}-${local.userDefinedStringPrefix_short}"
}
