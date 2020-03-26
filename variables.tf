variable "resource_group_name" {
  description = "(Required) Resource group name"
}

variable "location" {
  description = "(Required) Location of the resources"
}

variable "name" {
  description = "(Required) Log Analytics workspace name"
}

variable "solution_plan_map" {
  description = "(Required) Map structure containing the list of solutions to be enabled."
  type = map(any)
}

variable "tags" {
  description = "(Required) tagging for the log analytics workspace"
}

variable "convention" {
  description = "(Required) Naming convention method to use"  
}

variable "prefix" {
  description = "(Optional) You can use a prefix to the name of the resource"
  type        = string
  default = ""
}

variable "postfix" {
  description = "(Optional) You can use a postfix to the name of the resource"
  type        = string
  default = ""
}

variable "max_length" {
  description = "(Optional) You can speficy a maximum length to the name of the resource"
  type        = string
  default = ""
}
