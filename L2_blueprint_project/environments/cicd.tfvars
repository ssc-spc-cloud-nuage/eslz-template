tags = {
  "classification"    = "pbmm"
  "contact"           = "bernard.maltais@163dev.onmicrosoft.com"
  "costcentre"        = "56a54668sdfsf11"
  "env"               = "dev"
  "owner"             = "bernard.maltais@163dev.onmicrosoft.com"
  "cloudusageprofile" = "3"
  "branch"            = "CIO"
}

env     = "ScDc"
group   = "CIO"
project = "CICDTest"

location = "canadacentral"

Landing-Zone-Next-Hop = "172.168.3.22"

RDS-Gateways           = ["10.101.16.4"]

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

  contributorEnterpriseID = []

  ownerNames = [
    "john.nephin@163dev.onmicrosoft.com",
    "bernard.maltais@163dev.onmicrosoft.com",
    "pat.heard@163dev.onmicrosoft.com"
  ]

  contributorNames = [
    "louis-eric.tremblay@163dev.onmicrosoft.com"
  ]

  readerNames = []
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

# Fill the section below with the values from the output of ./gorover.sh <env> validate. Look in the section
# called Getting launchpad coordinates: It will look like:
# Getting launchpad coordinates:
#  - tfstate file: launchpad_opensource_light.tfstate

L1_terraform_remote_state_config = {
    key                   = "L1_blueprint_base_cicd.tfstate"
}