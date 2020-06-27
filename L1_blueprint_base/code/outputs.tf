output "resource_groups" {
  value     = local.resource_groups
  sensitive = true
}

output "subnets" {
  value     = local.subnets
  sensitive = true
}

output "Project-law" {
  value     = module.Project-law.object
  sensitive = true
}

output "Project_law-sa" {
  value     = module.Project_law-sa.object
  sensitive = true
}

output "Project-kv" {
  value     = azurerm_key_vault.Project-kv
  sensitive = true
}