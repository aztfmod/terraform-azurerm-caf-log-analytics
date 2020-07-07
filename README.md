[![VScodespaces](https://img.shields.io/endpoint?url=https%3A%2F%2Faka.ms%2Fvso-badge)](https://online.visualstudio.com/environments/new?name=terraform-azurerm-caf-log-analytics&repo=aztfmod/terraform-azurerm-caf-log-analytics)

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

<!--- END_TF_DOCS --->
<!--- BEGIN_TF_DOCS --->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| azurecaf | n/a |
| azurerm | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| convention | (Required) Naming convention to be used (check at the naming convention module for possible values). | `string` | n/a | yes |
| location | (Required) Location of the resources | `any` | n/a | yes |
| max\_length | (Optional) You can speficy a maximum length to the name of the resource | `string` | `""` | no |
| name | (Required) Log Analytics workspace name | `any` | n/a | yes |
| postfix | (Optional) You can use a postfix to the name of the resource | `string` | `""` | no |
| prefix | (Optional) You can use a prefix to the name of the resource | `string` | `""` | no |
| resource\_group\_name | (Required) Resource group name | `any` | n/a | yes |
| retention\_in\_days | (Optional) The workspace data retention in days. Possible values are either 7 (Free Tier only) or range between 30 and 730. | `string` | `""` | no |
| solution\_plan\_map | (Optional) Map structure containing the list of solutions to be enabled. | `map(any)` | `{}` | no |
| tags | (Required) tagging for the log analytics workspace | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| id | Output the object ID |
| name | Output the object name |
| object | Output the full object |

