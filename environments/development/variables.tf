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

# this for the conta8iner app

# variable "container_app_name" {
#   type    = string
#   default = "anzz-nodejs-app"
# }

# variable "container_app_environment_name" {
#   type    = string
#   default = "anzz-containerapp-env"
# }

# variable "container_port" {
#   type    = number
#   default = 3000
# }

# variable "container_app_image" {
#   type    = string
#   default = "nodejs-docker-app"
# }