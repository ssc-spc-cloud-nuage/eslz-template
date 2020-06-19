tags = {
  "classification"    = "pbmm"
  "contact"           = "bernard.maltais@canada.ca; john.nephin@canada.ca"
  "costcentre"        = "566811"
  "env"               = "sandbox"
  "owner"             = "bernard.maltais@canada.ca; john.nephin@canada.ca"
  "cloudusageprofile" = "3"
  "branch"            = "CIO"
}

env     = "ScSc"
group   = "CIO"
project = "ESLZ"

location = "canadacentral"

Subscription_AADGroup_Owners_ids = [
  "446fe20e-1b5c-45fc-a04e-5ae7cfb66684", # Bernard Maltais
  "d4decfde-8300-4fa4-aa36-7c22bf22a868", # John Nephin
  "aea74c39-1a88-47f5-8c31-a6d0c1173aa3"  # Louis-Eric Tremblay
]

Project-vnet = [
  "172.16.128.0/20"
]
Project-subnets = {
  PAZ = "172.16.132.0/26"
  OZ  = "172.16.132.64/26"
  RZ  = "172.16.132.128/26"
}
Landing-Zone-Next-Hop = "172.168.3.22"
RDS-Gateway           = "10.101.16.4"

domain = {
  public = {
    name = "eslz.sb.ciso.ssc-spc.gc.ca"
  }
  private = {
    name                 = "eslz.local"
    registration_enabled = true # Set to true if auto-registration of virtual machine records in the virtual network in the Private DNS zone enabled?
  }
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