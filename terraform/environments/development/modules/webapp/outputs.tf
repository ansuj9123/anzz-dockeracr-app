output "webapp_name" {
  value = azurerm_linux_web_app.webapp.name
}

output "default_hostname" {
  value = azurerm_linux_web_app.webapp.default_hostname
}

output "principal_id" {
  value = azurerm_linux_web_app.webapp.identity[0].principal_id
}

output "service_plan_id" {
  value = azurerm_service_plan.plan.id
}