# Storage acccount required by the Function App
resource "azurerm_storage_account" "storage_account" {
  name                     = "${var.name}fasa"
  resource_group_name      = var.resource_group_name
  location                 = var.region
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

# App Service Plan required by the Function App
resource "azurerm_service_plan" "service_plan" {
  name = "${var.name}-plan"
  resource_group_name = var.resource_group_name
  location = var.region
  os_type = "Windows"
  sku_name = "Y1"
}

# Function App
resource "azurerm_windows_function_app" "function_app" {
  name = "${var.name}-funcapp"
  resource_group_name = var.resource_group_name
  location = var.region
  storage_account_name = azurerm_storage_account.storage_account.name
  storage_account_access_key = azurerm_storage_account.storage_account.primary_access_key
  service_plan_id = azurerm_service_plan.service_plan.id

  site_config {}
}