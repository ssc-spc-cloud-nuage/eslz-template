output "storage_account_name" {
  value = "\"${azurerm_storage_account.storage.name}\""
}

output "access_key" {
  value = "\"${azurerm_storage_account.storage.primary_access_key}\""
}

output "container_name" {
  value = "\"${azurerm_storage_container.state.name}\""
}
