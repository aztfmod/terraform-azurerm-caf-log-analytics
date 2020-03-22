resource "azurecaf_naming_convention" "caf_name_la" {  
  name    = var.name
  prefix  = var.prefix != "" ? var.prefix : null
  resource_type    = "la"
  convention  = var.convention
}

resource "azurerm_log_analytics_workspace" "log_analytics" {
  name                = azurecaf_naming_convention.caf_name_la.result
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "PerGB2018"
  tags                = local.tags
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

  // tags = var.tags
  // Tags not implemented in TF for azurerm_log_analytics_solution

  plan {
      product        = var.solution_plan_map[element(local.solution_list, count.index)].product
      publisher      = var.solution_plan_map[element(local.solution_list, count.index)].publisher
    }
  }