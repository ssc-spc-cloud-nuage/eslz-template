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

Landing-Zone-Next-Hop = "10.10.20.20"
RDS-Gateways           = ["100.96.185.4", "100.96.185.5"]

domain = {
  public = {
    name = "vnext13.domain.com"
  }
  private = {
    name                 = "vnext13.domain.local"
    registration_enabled = true # Set to true if auto-registration of virtual machine records in the virtual network in the Private DNS zone enabled?
  }
}

L2_RBAC = {
  contributorNames = [
  ]

  contributorEnterpriseID = [
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

  SRV-linux-mgmt = {
    admin_password = "canada123!"
    vm_size        = "Standard_D2s_v3"
    priority       = "Spot"
    private_ip_address = ["10.10.10.100"]
  }
}

L1_terraform_remote_state_config = {
    key = "L1_blueprint_base_vnext13.tfstate" # <------------ DOn't forget to set the env name!!!
}