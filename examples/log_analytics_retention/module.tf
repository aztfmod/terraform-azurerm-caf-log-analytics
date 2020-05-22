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
    resource_group_name = azurerm_resource_group.rg_test.name
    tags                = local.tags
    retention_in_days   = local.retention_in_days
}