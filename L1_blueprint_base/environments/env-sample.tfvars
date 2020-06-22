tags = {
  "classification"    = "pbmm"
  "contact"           = "user1@domain.ca; user1@domain.ca"
  "costcentre"        = "56a54668sdfsf11"
  "env"               = "dev"
  "owner"             = "user1@domain.ca; user1@domain.ca"
  "cloudusageprofile" = "3"
  "branch"            = "CIO"
}

env     = "ScDc"
group   = "CIO"
project = "ESLZ"

location = "canadacentral"

deployOptionalFeatures = {
  ddos_protection_plan       = false
  recovery_services_vault    = false
  security_center            = true
  sentinel                   = false
  update_management          = false
  deny_publicip_subscription = true
  deny_publicips_on_nics     = true
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

# Who will own the AAD Security Group and could make membership modification.
Subscription_AADGroup_Owners_ids = [
  "446fe20e-1b5c-45fc-a04e-5ae7cfb66684", # User 1 ID
  "d4decfde-8300-4fa4-aa36-7c22bf22a868", # User 2 ID
  "aea74c39-1a88-47f5-8c31-a6d0c1173aa3"  # User 3 ID
]

network = {
  vnet = ["10.101.240.0/24"]
  subnets = {
    PAZ = ["10.101.240.0/27"]
    OZ  = ["10.101.240.32/27"]
    RZ  = ["10.101.240.64/27"]
    MAZ = ["10.101.240.96/27"]
  }
}
Landing-Zone-Next-Hop = "172.168.3.22"
RDS-Gateway           = "10.101.16.4"

domain = {
  public = {
    name = "eslz.dev.ciso.ssc-spc.gc.ca"
  }
  private = {
    name                 = "eslz.dev.local"
    registration_enabled = true # Set to true if auto-registration of virtual machine records in the virtual network in the Private DNS zone enabled?
  }
}

L1_RBAC = {
  ownerNames = [
    "user1@163dev.onmicrosoft.com",
    "user1@163dev.onmicrosoft.com"
  ]

  contributorNames = [
    "user3@163dev.onmicrosoft.com"
  ]

  readerNames = [
    "user4@163dev.onmicrosoft.com"
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
    admin_password = "tmp-53w45trdfg"
    vm_size        = "Standard_D2s_v3"
    priority       = "Spot"
  }
}

