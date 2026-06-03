variable "subscription_id" {
  description = "The Azure subscription ID used by the azurerm provider."
  type        = string
}

variable "client_id" {
  description = "The Azure client ID used by the azurerm provider."
  type        = string
}

variable "client_secret" {
  description = "The Azure client secret used by the azurerm provider."
  type        = string
  sensitive   = true
}

variable "tenant_id" {
  description = "The Azure tenant ID used by the azurerm provider."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the Azure resource group to create."
  type        = string
  default     = "my-resource-group"
}

variable "region" {
  description = "The Azure region where resources will be deployed."
  type        = string
  default     = "francecentral"
}

variable "app_name" {
  description = "The application name used to name the Function App resources."
  type        = string
  default     = "myfunctionapp"
}

variable "static_web_app_name" {
  description = "The name of the Static Web App."
  type        = string
  default     = "mystaticwebapp"
}
