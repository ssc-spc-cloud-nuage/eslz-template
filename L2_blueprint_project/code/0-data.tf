data "azurerm_client_config" "current" {}

data "azurerm_dns_zone" "zone1" {
  name = "${var.domain.public.name}"
}