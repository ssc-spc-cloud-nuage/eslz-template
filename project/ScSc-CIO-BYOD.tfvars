tags = {
  "classification"    = "pbmm"
  "contact"           = "bernard.maltais@canada.ca; john.nephin@canada.ca"
  "costcentre"        = "566811"
  "env"               = "sandbox"
  "owner"             = "bernard.maltais@canada.ca; john.nephin@canada.ca"
  "cloudusageprofile" = "3"
  "branch"            = "CIO"
}

location = "canadacentral"
logAnalyticsWorkspaceName = "ScScCLD-CIO-Core-law"
logAnalyticsWorkspaceResourceGroupName = "ScSc-CIO_Logs-rg"
automationAccountName =  "ScSc-CIO-Core-aa"
automationAccountResourceGroupName = "ScSc-CIO_AutomationAccount-rg"

env     = "ScSc"
group   = "CIO"
project = "BYOD"
domain  = "sb.ciso.ssc-spc.gc.ca"

Project_PAZ-snet = "172.16.133.0/26"
Project_OZ-snet  = "172.16.133.64/26"
Project_RZ-snet  = "172.16.133.128/26"
RDS-Gateway      = "10.101.16.4"
LZ-Gateway       = "172.16.3.22"

subscriptionKeyvaultName = "ScScCKV-CIO-1b9923e6-kv"

contributorNames = [
  "marvin.sun@163dev.onmicrosoft.com",
  "rabie.almatarneh@163dev.onmicrosoft.com",
  "jonathan.routliffe@163dev.onmicrosoft.com",
  "test-bernard.maltais@163dev.onmicrosoft.com"
]

contributorEnterpriseID = [
  "bb294f5d-fece-4d3a-a187-7f98cb64e478", # Bernard Maltais SP
  "2000c7f5-0f8d-4a45-a65d-d70dc3edcac3"  # John Nephin SP
]

readerNames = ["mark.malkowski@163dev.onmicrosoft.com"]

vm_configs = {
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

  SRV-BYOD-mgmt = {
    admin_password = "BYOD123#a"
    vm_size        = "Standard_D2s_v3"
    priority       = "Spot"
  }
}