[![Gitter](https://badges.gitter.im/aztfmod/community.svg)](https://gitter.im/aztfmod/community?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge)

# Deploys Azure Monitor Log Analytics 
Creates the log analytics and monitoring solutions. 

Reference the module to a specific version (recommended):
```hcl
module "log_analytics" {
    source  = "aztfmod/caf-log-analytics/azurerm"
    version = "0.x.y"

    name                              = var.name
    solution_plan_map                 = var.solutions
    resource_group_name               = var.rg
    prefix                            = var.prefix
    location                          = var.location
    tags                              = var.tags
    
}
```

## Inputs 

| Name | Type | Default | Description |
| -- | -- | -- | -- |
| resource_group_name | string | None | (Required) Name of the resource group where to create the resource. Changing this forces a new resource to be created. |
| name | string | None | (Required) Name for the objects created (before naming convention applied.) |
| location | string | None | (Required) Specifies the Azure location to deploy the resource. Changing this forces a new resource to be created.  |
| tags | map | None | (Required) Map of tags for the deployment.  |
| solution_plan_map | map | None | (Optional) Map structure containing the list of solutions to be enabled. (see details of the structure in the Parameters section below) |
| retention_in_days | number | None | (Optional) The workspace data retention in days. Possible values are either 7 (Free Tier only) or range between 30 and 730. |
| convention | string | None | (Required) Naming convention to be used (check at the naming convention module for possible values).  |
| prefix | string | None | (Optional) Prefix to be used. |
| postfix | string | None | (Optional) Postfix to be used. |
| max_length | string | None | (Optional) maximum length to the name of the resource. |


## Parameters

### solution_plan_map
(Optional) Map of tags for the deployment
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


## Outputs

| Name | Type | Description | 
| -- | -- | -- | 
| object | object | Returns the full object of the created log analytics. |
| name | string | Returns the name of the created log analytics. |
| id | string | Returns the ID of the created log analytics. | 
