tags = {
  "classification"    = "pbmm"
  "contact"           = "louis-eric.tremblay@canada.ca, bernard.maltais@canada.ca"
  "costcentre"        = "566511"
  "env"               = "Dev"
  "owner"             = "justin.toussaint-mignault@canada.ca"
  "cloudusageprofile" = "3"
  "branch"            = "CIO"
}

env     = "ScDc"
group   = "CIO"
project = "ESLZ"

location = "canadacentral"

deployOptionalFeatures = {
  ddos_protection_plan       = false
  defaultRoute               = true
  recovery_services_vault    = true
  security_center            = false
  sentinel                   = false
  update_management          = true
  deny_publicip_policy       = false
  diagnostics_policy         = true
  flow_logs_policy           = true
  jumpServer                 = true
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
  routes = []
  vnet = ["10.144.196.0/24"]
  subnets = {
    PAZ = ["10.144.196.128/25"]
    OZ  = ["10.144.196.32/27"]
    RZ  = ["10.144.196.64/27"]
    MAZ = ["10.144.196.96/27"]
  }
}
Landing-Zone-Next-Hop = "10.144.2.10"

domain = {
  public = {
    name = "cio-dev-eslz.ssc-spc.cloud-nuage.canada.ca"
  }
  private = {
    name                 = "cio-dev-eslz.local"
    registration_enabled = true # Set to true if auto-registration of virtual machine records in the virtual network in the Private DNS zone enabled?
  }
}

L1_RBAC = {
  ownerNames = [
    "louis-eric.tremblay@ssc-spc.gc.ca",
    "bernard.maltais@ssc-spc.gc.ca",
  ]

  contributorNames = [
  ]

  readerNames = [
  ]

  ownerObjectIDs = [
    "f36e31cf-2fcf-4df2-a769-c74d77f9445a", # Terraform-CIO-Automation-SP for CI/CI github actions pipeline execution
  ]
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
    deploy                  = false
    serverType              = "SWJ"
    userDefinedString       = "RDS"
    postfix                 = "01"
    resource_group          = "Management"
    subnet                  = "MAZ"
    public_ip               = false
    private_ip_address_host = 4
    admin_username          = "azureadmin"
    admin_password          = "Canada123!"
    os_managed_disk_type    = "StandardSSD_LRS"
    vm_size                 = "Standard_D4s_v3"
    priority                = "Spot"
    storage_image_reference = {
      publisher = "MicrosoftWindowsServer"
      offer     = "WindowsServer"
      sku       = "2019-Datacenter"
      version   = "latest"
    }
    encryptDisks = true
  }
]
