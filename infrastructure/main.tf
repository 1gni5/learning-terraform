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