output "resource_groups_L1" {
  value     = local.resource_groups_L1
  sensitive = true
}

output "subnets" {
  value     = local.subnets
  sensitive = true
}

output "Project-law" {
  value     = local.Project-law
  sensitive = true
}

output "Project_law-sa" {
  value     = module.Project_law-sa.object
  sensitive = true
}

output "Project-kv" {
  value     = local.Project-kv
  sensitive = true
}

output "L2_Subscription_Owners" {
  value     = local.azuread_groups_L1.L2_Subscription_Owners
  sensitive = true
}

output "L2_Subscription_Contributors" {
  value     = local.azuread_groups_L1.L2_Subscription_Contributors
  sensitive = true
}

output "L2_Subscription_Readers" {
  value     = local.azuread_groups_L1.L2_Subscription_Readers
  sensitive = true
}