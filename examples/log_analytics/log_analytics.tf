resource "azurerm_resource_group" "rg_test" {
  name     = local.resource_groups.test.name
  location = local.resource_groups.test.location
  tags     = local.tags
}

module "la_test" {
  source = "../../"
  
    convention          = local.convention
    location            = local.location
    name                = local.name
    solution_plan_map   = local.solution_plan_map 
    # prefix              = local.prefix
    resource_group_name = azurerm_resource_group.rg_test.name
    tags                = local.tags
}