# General variables for the Azure Function App deployment.
variable "resource_group_name" {
  description = "The name of the resource group in which to create the resources."
  type        = string
}

variable "region" {
  description = "The Azure region where the resources will be created."
  type        = string
}

variable "app_name" {
  description = "The name of the Function App."
  type        = string
}

# Storage account specific variables.
variable "account_tier" {
  description = "The performance tier of the storage account."
  type        = string
  default     = "Standard"
}

variable "account_replication_type" {
  description = "The replication type of the storage account."
  type        = string
  default     = "LRS"
}

# App Service plan SKU variables.
variable "app_service_plan_sku_tier" {
  description = "The pricing tier for the App Service plan."
  type        = string
  default     = "Dynamic"
}

variable "app_service_plan_sku_size" {
  description = "The SKU name for the App Service plan (for example, Y1 for Consumption)."
  type        = string
  default     = "Y1"
}