# Azure Cosmos DB account
resource "azurerm_cosmosdb_account" "db_account" {
  name = "${var.name}-cosmosdb-account"
  location = var.region
  resource_group_name = var.resource_group_name
  offer_type = "Standard"
  capabilities {
    name = "EnableServerless"
  }
  consistency_policy {
    consistency_level = "Eventual"
  }
  geo_location {
    location = "northeurope"
    failover_priority = 0
  }
} 

# Cosmos DB SQL database
resource "azurerm_cosmosdb_sql_database" "sql_database" {
  name                = "${var.name}-sql-db"
  resource_group_name = var.resource_group_name
  account_name        = azurerm_cosmosdb_account.db_account.name
}

# Cosmos DB SQL container
resource "azurerm_cosmosdb_sql_container" "sql_container" {
  name                = "${var.name}-sql-container"
  resource_group_name = var.resource_group_name
  account_name        = azurerm_cosmosdb_account.db_account.name
  database_name       = azurerm_cosmosdb_sql_database.sql_database.name
  partition_key_paths = ["/definition/id"]
}