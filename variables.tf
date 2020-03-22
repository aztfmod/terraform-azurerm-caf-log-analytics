variable "resource_group_name" {
  description = "(Required) Resource group name"
}

variable "location" {
  description = "(Required) Location of the resources"
}

variable "prefix" {
  description = "(Optional) Prefix to add to resources"
  default = ""
}

variable "name" {
  description = "(Required) Log Analytics workspace name"
}

variable "solution_plan_map" {
  description = "(Optional) Map structure containing the list of solutions to be enabled."
  type = map(any)
}

variable "tags" {
  description = "(Required) tagging for the log analytics workspace"
}

variable "convention" {
  description = "(Required) Naming convention method to use"  
}