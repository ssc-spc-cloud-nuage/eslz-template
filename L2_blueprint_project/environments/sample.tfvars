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

L2_RBAC = {
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

  SRV-linux-mgmt = {
    admin_password = "tmp-e4d5rtc!"
    vm_size        = "Standard_D2s_v3"
    priority       = "Spot"
  }
}