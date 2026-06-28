variable "webapp_name" {
  description = "Name of the Linux Web App"
  type        = string
}

variable "service_plan_name" {
  description = "Name of the App Service Plan"
  type        = string
}

variable "resource_group_name" {
  description = "Resource Group Name"
  type        = string
}

variable "location" {
  description = "Azure Region"
  type        = string
}

variable "acr_id" {
  description = "Azure Container Registry Resource ID"
  type        = string
}

variable "acr_login_server" {
  description = "Azure Container Registry Login Server"
  type        = string
}

variable "container_app_image" {
  description = "Container Image Repository"
  type        = string
}

variable "image_tag" {
  description = "Container Image Tag"
  type        = string
  default     = "latest"
}

variable "container_port" {
  description = "Port exposed by the container"
  type        = number
}