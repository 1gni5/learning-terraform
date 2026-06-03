resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.region
}

module "azure_function_app" {
  source = "./azure-function-app"

  resource_group_name = azurerm_resource_group.rg.name
  region              = azurerm_resource_group.rg.location
  app_name            = var.app_name
}

# Static Web App for hosting frontend
resource "azurerm_static_web_app" "swa" {
  name                = "swa-${var.static_web_app_name}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku_tier            = "Free"
  sku_size            = "Free"
}