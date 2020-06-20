resource azurerm_policy_definition deny_publicip_subscription {
  count        = var.deployOptionalFeatures.deny_publicip_subscription ? 1 : 0
  name         = "pol-deny-publicip-creation"
  policy_type  = "Custom"
  mode         = "Indexed"
  display_name = "TF-Deny public IP in subscription"
  policy_rule  = <<POLICY_RULE
   {
	"if": {
        "field": "type",
        "in": [
          "Microsoft.Network/publicIPAddresses"
        ]
      },
      "then": {
        "effect": "deny"
      }
}
POLICY_RULE
}

resource azurerm_policy_assignment deny-publicip-subscription {
  count                = var.deployOptionalFeatures.deny_publicip_subscription ? 1 : 0
  name                 = "deny-publicip-subscription"
  scope                = data.azurerm_subscription.primary.id
  policy_definition_id = azurerm_policy_definition.deny_publicip_subscription[0].id
  description          = "Policy Assignment for deny public IP creating in subscriptions"
  display_name         = "TF Deny public IP in subscription"
}