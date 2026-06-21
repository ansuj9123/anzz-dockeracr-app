output "acr_login_server" {
  value = azurerm_container_registry.acr.login_server
}

output "acr_name" {
  value = azurerm_container_registry.acr.name
}

# this is for the container app

# output "container_app_url" {
#   value = azurerm_container_app.app.latest_revision_fqdn
# }