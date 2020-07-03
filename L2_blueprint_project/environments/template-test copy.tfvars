tags = {
  "classification"    = "pbmm"
  "contact"           = "bernard.maltais@canada.ca; john.nephin@canada.ca; louis-eric.tremblay@canada.ca"
  "costcentre"        = "566811"
  "env"               = "template-test"
  "owner"             = "bernard.maltais@canada.ca; john.nephin@canada.ca; louis-eric.tremblay@canada.ca"
  "cloudusageprofile" = "3"
  "branch"            = "CIO"
}

env     = "ScDc"
group   = "CIO"
project = "ESLZ_Template"

location = "canadacentral"

Landing-Zone-Next-Hop = "100.96.185.8"
RDS-Gateway           = ["10.101.16.4"]

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
  contributorNames = [
    "john.nephin@163dev.onmicrosoft.com",
    "bernard.maltais@163dev.onmicrosoft.com",
    "louis-eric.tremblay@163dev.onmicrosoft.com",
    "test-bernard.maltais@163dev.onmicrosoft.com"
  ]

  contributorEnterpriseID = [
    "bb294f5d-fece-4d3a-a187-7f98cb64e478", # Bernard Maltais SP
    "2000c7f5-0f8d-4a45-a65d-d70dc3edcac3"  # John Nephin SP
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
    admin_password = "tmp-canada123!"
    vm_size        = "Standard_D2s_v3"
    priority       = "Spot"
  }
}

L1_terraform_remote_state_config = {
    storage_account_name  = "scdccioeslztemplatestlev"
    container_name        = "template-test"
    key                   = "L1_blueprint_base.tfstate"
    resource_group_name   = "ScDc-CIO_ESLZ_Template-terraform-state"
}