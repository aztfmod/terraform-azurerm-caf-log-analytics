locals {
  convention = "cafrandom"
  name       = "caftest"
  location   = "southeastasia"
  prefix     = "test"
  resource_groups = {
    test = {
      name     = "test-caf-loganalytics-simple"
      location = "southeastasia"
    },
  }
  tags = {
    environment = "DEV"
    owner       = "CAF"
  }

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
}