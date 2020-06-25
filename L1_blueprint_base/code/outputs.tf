output "Project_PAZ-snet" {
  value = module.Project_PAZ-snet.object
  sensitive   = true
}

output "Project_OZ-snet" {
  value = module.Project_OZ-snet.object
  sensitive   = true
}

output "Project_RZ-snet" {
  value = module.Project_RZ-snet.object
  sensitive   = true
}

output "Project_MAZ-snet" {
  value = module.Project_MAZ-snet.object
  sensitive   = true
}

output "Project-law" {
  value = azurerm_log_analytics_workspace.Project-law
  sensitive   = true
}

output "Project_law-sa" {
  value = azurerm_storage_account.Project_law-sa
  sensitive   = true
}

output "Project-kv" {
  value = azurerm_key_vault.Project-kv
  sensitive   = true
}