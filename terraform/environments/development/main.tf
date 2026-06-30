terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 2.0"
    }
  }
}

provider "azurerm" {
  features {}
}

provider "azuread" {}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_container_registry" "acr" {
  name                = var.acr_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = "Basic"
  admin_enabled       = false # Secure: Use OIDC/AAD auth instead of admin keys
}

# Resolve a Service Principal by client (application) ID if provided
data "azuread_service_principal" "sp" {
  count         = length(trimspace(var.service_principal_client_id)) > 0 ? 1 : 0
  application_id = var.service_principal_client_id
}

locals {
  principal_id = length(trimspace(var.service_principal_object_id)) > 0 ? var.service_principal_object_id : (
    length(data.azuread_service_principal.sp) > 0 ? data.azuread_service_principal.sp[0].object_id : ""
  )
}

# Assigns the AcrPush role to your OIDC Service Principal
resource "azurerm_role_assignment" "acr_push" {
  scope                = azurerm_container_registry.acr.id
  role_definition_name = "AcrPush"
  principal_id         = local.principal_id
}

module "webapp" {

  source = "./modules/webapp/"

  webapp_name       = var.webapp_name
  service_plan_name = var.service_plan_name

  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  acr_id           = azurerm_container_registry.acr.id
  acr_login_server = azurerm_container_registry.acr.login_server

  container_image = var.container_app_image
  image_tag       = "latest"

  container_port = var.container_port
}