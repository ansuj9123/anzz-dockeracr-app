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
}