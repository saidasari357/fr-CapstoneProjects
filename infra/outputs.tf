output "production_url" {
  description = "URL of the production App Service"
  value       = "https://${azurerm_app_service.app.default_site_hostname}"
}

output "staging_url" {
  description = "URL of the staging slot"
  value       = "https://${azurerm_app_service_slot.staging.default_site_hostname}"
}
