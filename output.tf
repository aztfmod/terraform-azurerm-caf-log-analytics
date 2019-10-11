output "id" {
  description = "Output the object ID"
  value      = azurerm_log_analytics_workspace.log_analytics.id
}

output "name" {
  description = "Output the object name"
  value      = azurerm_log_analytics_workspace.log_analytics.name
}

output "object" {
  description = "Output the full object"
  value      = azurerm_log_analytics_workspace.log_analytics
}