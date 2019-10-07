[![Build status](https://dev.azure.com/azure-terraform/Blueprints/_apis/build/status/modules/log_analytics)](https://dev.azure.com/azure-terraform/Blueprints/_build/latest?definitionId=3)
# Deploys Azure Monitor Log Analytics 
Creates the log analytics and monitoring solutions. 


Reference the module to a specific version (recommended):
```hcl
module "log_analytics" {
    source                  = "git://github.com/aztfmod/log_analytics.git?ref=v1.1"
  
    name                              = var.name
    solution_plan_map                 = var.solutions
    resource_group_name               = var.rg
    prefix                            = var.prefix
    location                          = var.location
    tags                              = var.tags
    
}
```

Or get the latest version
```hcl
module "log_analytics" {
    source                  = "git://github.com/aztfmod/log_analytics.git?ref=latest"
  
    name                              = var.name
    solution_plan_map                 = var.solutions
    resource_group_name               = var.rg
    prefix                            = var.prefix
    location                          = var.location
    tags                              = var.tags
}
```

# Parameters

## name
(Required) Log Analytics workspace name
```hcl
variable "name" {
  description = "Log Analytics workspace name"
}
```
Example
```hcl
name = "myloganalytics"
```

## resource_group_name
(Required) (Required) Name of the resource group to deploy the operations log.
```hcl
variable "resource_group_name" {
  description = "(Required) Name of the resource group to deploy the operations log."
}

```
Example
```hcl
resource_group_name = "operations-rg"
```

## location
(Required) Define the region where the resource groups will be created
```hcl
variable "location" {
  description = "(Required) Define the region where the resource groups will be created"
  type        = string
}
```
Example
```
    location    = "southeastasia"
```

## prefix
(Optional) You can use a prefix to add to the list of resource groups you want to create
```hcl
variable "prefix" {
    description = "(Optional) You can use a prefix to add to the list of resource groups you want to create"
}
```
Example
```hcl
locals {
    prefix = "${random_string.prefix.result}-"
}

resource "random_string" "prefix" {
    length  = 4
    upper   = false
    special = false
}
```

## tags
(Required) Map of tags for the deployment
```hcl
variable "tags" {
  description = "(Required) map of tags for the deployment"
}
```
Example
```hcl
tags = {
    environment     = "DEV"
    owner           = "Arnaud"
    deploymentType  = "Terraform"
  }
```

## solution_plan_map
(Required) Map of tags for the deployment
```hcl
variable "solution_plan_map" {
  description = "(Optional) Map structure containing the list of solutions to be enabled."
  type = map(any)
}
```
Example
```hcl
solution_plan_map = {
    ADAssessment = {
        "publisher" = "Microsoft"
        "product"   = "OMSGallery/ADAssessment"
    },
    ADReplication = {
        "publisher" = "Microsoft"
        "product"   = "OMSGallery/ADReplication"
    },
    AgentHealthAssessment = {
        "publisher" = "Microsoft"
        "product"   = "OMSGallery/AgentHealthAssessment"
    },
    DnsAnalytics = {
        "publisher" = "Microsoft"
        "product"   = "OMSGallery/DnsAnalytics"
    },
    KeyVaultAnalytics = {
        "publisher" = "Microsoft"
        "product"   = "OMSGallery/KeyVaultAnalytics"
    }
}

```


# Output
## object
Returns the full object of the created log analytics.
```hcl
output "object" {
  value      = azurerm_log_analytics_workspace.log_analytics
}
```


## id
Returns the resource id of the created log analytics. 
```hcl
output "id" {
  value      = azurerm_log_analytics_workspace.log_analytics.id
}
```

## name
Returns the name of the created log analytics.
```hcl
output "name" {
  value      = azurerm_log_analytics_workspace.log_analytics.name
}
```