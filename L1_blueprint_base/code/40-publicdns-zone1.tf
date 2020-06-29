resource azurerm_dns_zone zone1 {
  name                = var.domain.public.name
  resource_group_name = local.resource_groups_L1.DNS.name
  tags                = var.tags
}

# resource "azurerm_dns_mx_record" "mx-zone1" {
#   name      = "@"
#   zone_name = azurerm_dns_zone.zone1.name
#   ttl       = "60"
#   record {
#     preference = 0
#     exchange   = "${var.domain}.mail.protection.outlook.com"
#   }
#   resource_group_name = local.resource_groups_L1.DNS.name
#   tags                = var.tags
# }

# resource "azurerm_dns_cname_record" "autodiscover-zone1" {
#   name                = "autodiscover"
#   zone_name           = azurerm_dns_zone.zone1.name
#   ttl                 = "60"
#   record              = "autodiscover.outlook.com"
#   resource_group_name = local.resource_groups_L1.DNS.name
#   tags                = var.tags
# }

# resource "azurerm_dns_txt_record" "MS-spf-zone1" {
#   name      = "@"
#   zone_name = azurerm_dns_zone.zone1.name
#   ttl       = "60"
#   record {
#     value = var.MS-spf-zone1
#   }
#   record {
#     value = "v=spf1 include:spf.protection.outlook.com -all"
#   }
#   resource_group_name = local.resource_groups_L1.DNS.name
#   tags                = var.tags
# }

# Deployment specific records below

resource "azurerm_dns_txt_record" "acme-zone1" {
  zone_name = azurerm_dns_zone.zone1.name
  name      = lower("_acme-challenge.support")
  ttl       = "1"
  record {
    value = "5GI8Xhir8GDeCrfc7TtSdhZZByzHduSU3lNlgDXwjp0"
  }
  resource_group_name = local.resource_groups_L1.DNS.name
  tags                = var.tags
}
