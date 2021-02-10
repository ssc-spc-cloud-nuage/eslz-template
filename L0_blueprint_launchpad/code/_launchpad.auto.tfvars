level = "level0"

launchpad_key_names = {
  keyvault = "launchpad"
  aad_app  = "caf_launchpad_level0"
}

resource_groups = {
  tfstate = {
    name       = "launchpad-tfstates"
    useprefix  = true
    max_length = 40
  }
  security = {
    name       = "launchpad-security"
    useprefix  = true
    max_length = 40
  }
}

storage_account_name = "level0"

keyvaults = {
  # Do not rename the key "launchpad" to be able to upgrade to the standard launchpad
  launchpad = {
    name               = "launchpad"
    resource_group_key = "security"
    convention         = "cafrandom"
    sku_name           = "standard"
  }
}

subscriptions = {
  logged_in_subscription = {
    role_definition_name = "Owner"
    aad_app_key          = "caf_launchpad_level0"
  }
}

aad_apps = {
  # Do not rename the key "launchpad" to be able to upgrade to the standard launchpad
  caf_launchpad_level0 = {
    convention              = "cafrandom"
    useprefix               = true
    application_name        = "caf_launchpad_level0"
    password_expire_in_days = 180
    keyvault = {
      keyvault_key  = "launchpad"
      secret_prefix = "caf-launchpad-level0"
      access_policies = {
        key_permissions    = []
        secret_permissions = ["Get", "List", "Set", "Delete"]
      }
    }
  }
}