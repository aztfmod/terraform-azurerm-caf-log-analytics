locals {
  convention = "cafrandom"
  name       = "caftest"
  location   = "southeastasia"
  prefix     = "test"
  resource_groups = {
    test = {
      name     = "test-caf-loganalytics-retention"
      location = "southeastasia"
    },
  }
  tags = {
    environment = "DEV"
    owner       = "CAF"
  }
  retention_in_days = 365
}