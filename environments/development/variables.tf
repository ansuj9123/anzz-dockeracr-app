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
  default     = ""
}

variable "service_principal_validation" {
  type    = bool
  default = true
  description = "(internal) validation toggle - do not set"
}


