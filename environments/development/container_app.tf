resource "azurerm_container_app_environment" "env" {
  name                = "var.container_app_environment_name"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_container_app" "app" {
  name                         = "var.container_app_name"
  resource_group_name          = azurerm_resource_group.rg.name
  container_app_environment_id = azurerm_container_app_environment.env.id

  revision_mode = "Single"

  identity {
    type = "SystemAssigned"
  }

  registry {
    server   = azurerm_container_registry.acr.login_server
    identity = "System"
  }

  template {
    container {
      name   = "nodejs-app"
      image  = "${azurerm_container_registry.acr.login_server}/var.container_app_image :latest"

      cpu    = 0.5
      memory = "1Gi"

      env {
        name  = "NODE_ENV"
        value = "production"
      }
    }

    min_replicas = 1
    max_replicas = 3
  }

  ingress {
    external_enabled = true
    target_port      = 3000

    traffic_weight {
      latest_revision = true
      percentage      = 100
    }
  }
}

resource "azurerm_role_assignment" "container_app_acr_pull" {
  scope                = azurerm_container_registry.acr.id
  role_definition_name = "AcrPull"
  principal_id         = azurerm_container_app.app.identity[0].principal_id
}