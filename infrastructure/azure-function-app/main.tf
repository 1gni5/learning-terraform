# Storage account required by the Function App
resource "azurerm_storage_account" "sa" {
  name = "fasa${var.app_name}"
  resource_group_name = var.resource_group_name
  location = var.region
  account_tier = var.account_tier
  account_replication_type = var.account_replication_type
}

# Service plan for the Function App
resource "azurerm_service_plan" "asp" {
  name = "fa-asp-${var.app_name}"
  resource_group_name = var.resource_group_name
  location = var.region
  os_type  = "Windows"
  sku_name = var.app_service_plan_sku_size
}

# Function App hosted on the App Service plan and backed by the storage account.
resource "azurerm_windows_function_app" "fa" {
  name                       = "fa-${var.app_name}"
  location                   = var.region
  resource_group_name        = var.resource_group_name
  service_plan_id            = azurerm_service_plan.asp.id
  storage_account_name       = azurerm_storage_account.sa.name
  storage_account_access_key = azurerm_storage_account.sa.primary_access_key
  functions_extension_version = "~4"

  site_config {}
}