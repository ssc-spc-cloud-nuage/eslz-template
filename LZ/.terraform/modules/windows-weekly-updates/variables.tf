variable "resource_group_name" {
  description = "Name of the resource group where the automation account is located"
  type = string
}

variable "name" {
  description = "Name of the update management schedule"
  type = string
}

variable "azurerm_automation_account" {
  description = "azurerm_automation_account object"
  type = object({name = string})
}

variable "operatingSystem" {
  description = "Name of the VM OS type. Linux or Windows"
  type = string
}

variable "duration" {
  description = "Time in hour permitted for updates"
  type = string
  default = "2"
}

variable "linux_update_types" {
  description = "Types of updates to apply when OS type is Linux. One or more of: Critical, Other, Security."
  type = string
  default = "Critical, Other, Security"
}

variable "windows_update_types" {
  description = "Types of updates to apply when OS type is Windows. One or more of: Critical, Security, UpdateRollup, ServicePack, Definition, Updates"
  type = string
  default = "Critical, Security, UpdateRollup, ServicePack, Definition, Updates"
}

variable "rebootSetting" {
  description = "One of: Never, Always, IfRequired"
  type = string
  default = "IfRequired"
}
variable "scope" {
  description = "Comma seperated string of resource groups id in scope for update"
  type = list(string)
  default     = []
}
variable "startTime" {
  description = "String of time when to start schedule"
  type = string
  default     = ""
}
variable "timeZone" {
  description = "Timezone where schedule run"
  type = string
  default     = "Eastern Standard Time"
}
variable "interval" {
  description = "Integer for interval"
  type = number
  default = 1
}
variable "weekDays" {
  description = "List of days to run. One or namy of: Sunday, Monday, Tuesday, Wednesday, Thrusday, Friday, Saturday."
  type = list(string)
  default = []
}