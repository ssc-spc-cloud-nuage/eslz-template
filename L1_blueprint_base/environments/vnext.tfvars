tags = {
  "classification"    = "pbmm"
  "contact"           = "<some email>; <some email>; etc"
  "costcentre"        = "566811"
  "env"               = "dev"
  "owner"             = "<some email>; <some email>; etc"
  "cloudusageprofile" = "3"
  "branch"            = "<branch name>"
}

env     = "ScSc"
group   = "CIO"
project = "ESLZ_vnext"

location = "canadacentral"

deployOptionalFeatures = {
  ddos_protection_plan       = false
  defaultRoute               = false
  recovery_services_vault    = false
  security_center            = false
  sentinel                   = false
  update_management          = false
  deny_publicip_policy       = false
  diagnostics_policy         = false
  flow_logs_policy           = false
  jumpServer                 = false
}

## Optional Features variables ##

optionalFeaturesConfig = {
  recovery_services_vault = {
    sku                 = "Standard" # Sets the vault's SKU. Possible values include: Standard, RS0
    soft_delete_enabled = true       # Is soft delete enable for this Vault?
  }
  security_center = {
    email = "some@test.com"
    phone = "123-456-7890"
  }
}

network = {
  vnet = ["10.10.10.0/24"]
  subnets = {
    PAZ = ["10.10.10.0/27"]
    OZ  = ["10.10.10.32/27"]
    RZ  = ["10.10.10.64/27"]
    MAZ = ["10.10.10.96/27"]
  }
}
Landing-Zone-Next-Hop = "10.10.20.10"

domain = {
  public = {
    name = "some.domain.com"
  }
  private = {
    name                 = "some.domain.local"
    registration_enabled = true # Set to true if auto-registration of virtual machine records in the virtual network in the Private DNS zone enabled?
  }
}

L1_RBAC = {
  ownerNames = [
  ]

  contributorNames = [
  ]

  readerNames = [
  ]
}

vmConfigs = {
  /*
  # Template for Linux server variables

  Server-Name = {
    deploy = bool # Optional. Default is true
    admin_username       = string # Optional. Default is "azureadmin" 
    admin_password       = string # Required
    os_managed_disk_type = string # Optional. Default is "StandardSSD_LRS"
    vm_size              = string # Required. Example: "Standard_D2s_v3"
    priority             = string # Optional. Default is "Regular". possible values are "Regular" or "Spot"
  }
  */

  SWJ-01 = {
    admin_password = "tmp-Canada123!"
    vm_size        = "Standard_D2s_v3"
    priority       = "Spot"
  }
}

