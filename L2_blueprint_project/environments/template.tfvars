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
project = "ESLZ_vnext13"

location = "canadacentral"

Landing-Zone-Next-Hop = "172.168.3.22"

RDS-Gateways           = ["10.101.16.4"]

domain = {
  public = {
    name = "some.domain.com"
  }
  private = {
    name                 = "some.domain.local"
    registration_enabled = true # Set to true if auto-registration of virtual machine records in the virtual network in the Private DNS zone enabled?
  }
}

L2_RBAC = {
  contributorEnterpriseID = []
  ownerNames = []
  contributorNames = []
  readerNames = []
}

windows_VMs = [
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

  {
    deploy                  = true
    serverType              = "SWJ"
    userDefinedString       = "maltdev"
    postfix                 = "01"
    resource_group          = "Management"
    subnet                  = "MAZ"
    private_ip_address_host = 6
    admin_username          = "azureadmin"
    admin_password          = "Canada123!"
    # custom_data             = "scripts/wsl2.ps1"
    os_managed_disk_type    = "StandardSSD_LRS"
    vm_size                 = "Standard_D4s_v3"
    priority                = "Spot"
    storage_image_reference = {
      publisher = "microsoft-hyperv"
      offer     = "windows10preview"
      sku       = "pro-preview"
      version   = "19041.208.2004162051"
    }
    plan = {
      name      = "pro-preview"
      publisher = "microsoft-hyperv"
      product   = "windows10preview"
    }
    shutdownConfig = {
      autoShutdownStatus             = "Enabled"
      autoShutdownTime               = "17:00"
      autoShutdownTimeZone           = "Eastern Standard Time"
      autoShutdownNotificationStatus = "Disabled"
    }
    encryptDisks = true
  }
]

# Fill the section below with the values from the output of ./gorover.sh <env> validate. Look in the section
# called Getting launchpad coordinates: It will look like:
# Getting launchpad coordinates:
#  - tfstate file: launchpad_opensource_light.tfstate

L1_terraform_remote_state_config = {
    key                   = "L1_blueprint_base_template.tfstate" # <========= Don't forget to update with the env name
}