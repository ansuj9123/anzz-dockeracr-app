variable "resource_group_name" {
  type    = string
  default = "rg-anzz-dockerapp"
}

variable "location" {
  type    = string
  default = "East US"
}

variable "acr_name" {
  type        = string
  default     = "anzzdockeracrapp" # Must be globally unique
  description = "The name of the ACR (alphanumeric only)"
}

variable "service_principal_object_id" {
  type        = string
  description = "The Object ID (not Client ID) of the Service Principal used for OIDC"
  default     = ""
}

variable "service_principal_client_id" {
  type        = string
  description = "The Client/Application ID of the Service Principal (optional). If provided, Terraform will resolve the Object ID via the azuread provider."
  default     = "0a451f6f-0e0f-42ca-ae00-76769bd2ea71"
}

variable "service_principal_validation" {
  type    = bool
  default = true
  description = "(internal) validation toggle - do not set"
}


variable "webapp_name" {
  default = "anzz-nodejs-webapp"
}

variable "service_plan_name" {
  default = "anzz-linux-plan"
}

variable "container_app_image" {
  type        = string
  description = "Container image name in ACR (e.g. nodejs-docker-app)"
  default     = "nodejs-docker-app"
}

variable "container_port" {
  type        = number
  description = "Port exposed by the container"
  default     = 3000
}
