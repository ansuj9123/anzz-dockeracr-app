resource "azurerm_service_plan" "plan" {
  name                = var.service_plan_name
  location            = var.location
  resource_group_name = var.resource_group_name

  os_type  = "Linux"
  sku_name = "F1"
}
# web app
resource "azurerm_linux_web_app" "webapp" {

  name                = var.webapp_name
  location            = var.location
  resource_group_name = var.resource_group_name

  service_plan_id = azurerm_service_plan.plan.id

  https_only = true

  identity {
    type = "SystemAssigned"
  }

  site_config {

    always_on = false

    application_stack {

      docker_image_name = "${var.container_image}:${var.image_tag}"

      docker_registry_url = "https://${var.acr_login_server}"

    }

    container_registry_use_managed_identity = true
  }

  app_settings = {

    WEBSITES_PORT = tostring(var.container_port)

  }

}

# webapp permission to pull

resource "azurerm_role_assignment" "acr_pull" {

  scope = var.acr_id

  role_definition_name = "AcrPull"

  principal_id = azurerm_linux_web_app.webapp.identity[0].principal_id

}