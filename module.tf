resource "azurecaf_naming_convention" "caf_name_la" {  
  name              = var.name
  prefix            = var.prefix != "" ? var.prefix : null
  resource_type     = "azurerm_log_analytics_workspace"
  postfix           = var.postfix != "" ? var.postfix : null
  max_length        = var.max_length != "" ? var.max_length : null
  convention        = var.convention
}

resource "azurerm_log_analytics_workspace" "log_analytics" {
  name                = azurecaf_naming_convention.caf_name_la.result
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "PerGB2018"
  tags                = local.tags
  retention_in_days   = var.retention_in_days != "" ? var.retention_in_days : null
}

locals {
  solution_list = keys(var.solution_plan_map)
}

resource "azurerm_log_analytics_solution" "la_solution" {
  count                 = length(local.solution_list)
  solution_name         = element(local.solution_list, count.index)
  location              = var.location
  resource_group_name   = var.resource_group_name
  workspace_resource_id = azurerm_log_analytics_workspace.log_analytics.id
  workspace_name        = azurerm_log_analytics_workspace.log_analytics.name

  plan {
      product        = var.solution_plan_map[element(local.solution_list, count.index)].product
      publisher      = var.solution_plan_map[element(local.solution_list, count.index)].publisher
    }
  }