# Resource group containing all the resources for this project
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.region
}

module "function_app" {
  source = "./azure-function-app"

  name                = var.app_name
  region              = var.region
  resource_group_name = azurerm_resource_group.rg.name
}

# Static Web App
resource "azurerm_static_web_app" "static_web_app" {
  name                = "${var.app_name}-swa"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
}

# Cosmos DB
module "cosmos_db" {
  source = "./azure-cosmos-db"

  name                = var.app_name
  region              = var.region
  resource_group_name = azurerm_resource_group.rg.name
}