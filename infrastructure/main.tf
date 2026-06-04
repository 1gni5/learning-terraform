# Resource group containing all the resources for this project
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.region
}

# Storage acccount required by the Function App
resource "azurerm_storage_account" "storage_account" {
  name                     = "${var.app_name}fasa"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

# App Service Plan required by the Function App
resource "azurerm_service_plan" "service_plan" {
  name = "${var.app_name}-plan"
  resource_group_name = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location
  os_type = "Windows"
  sku_name = "Y1"
}

# Function App
resource "azurerm_windows_function_app" "function_app" {
  name = "${var.app_name}-funcapp"
  resource_group_name = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location
  storage_account_name = azurerm_storage_account.storage_account.name
  storage_account_access_key = azurerm_storage_account.storage_account.primary_access_key
  service_plan_id = azurerm_service_plan.service_plan.id

  site_config {}
}

# Static Web App
resource "azurerm_static_web_app" "static_web_app" {
  name                = "${var.app_name}-swa"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
}