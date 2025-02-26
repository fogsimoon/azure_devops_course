resource "azurerm_service_plan" "backend_appserviceplan" {
  name                = var.back_asp_name
  location            = var.location
  resource_group_name = var.rg
  os_type             = "Linux"
  sku_name            = "F1"
}

resource "azurerm_linux_web_app" "backend_webapp" {
  name                = var.back_app_name
  location            = var.location
  resource_group_name = var.rg
  service_plan_id     = azurerm_service_plan.backend_appserviceplan.id
  depends_on          = [azurerm_service_plan.backend_appserviceplan]
  https_only          = true
  site_config {
    always_on           = false
    minimum_tls_version = "1.2"
    application_stack {
      node_version = "16-lts"
    }
  }
}

resource "azurerm_service_plan" "frontend_appserviceplan" {
  name                = var.front_asp_name
  location            = var.location
  resource_group_name = var.rg
  os_type             = "Linux"
  sku_name            = "F1"
}

resource "azurerm_linux_web_app" "frontend_webapp" {
  name                = var.front_app_name
  location            = var.location
  resource_group_name = var.rg
  service_plan_id     = azurerm_service_plan.frontend_appserviceplan.id
  depends_on          = [azurerm_service_plan.frontend_appserviceplan]
  https_only          = true
  site_config {
    always_on           = false
    minimum_tls_version = "1.2"
    application_stack {
      node_version = "16-lts"
    }
  }
}

resource "random_pet" "azurerm_mssql_server_name" {
  prefix = "sql"
}

resource "azurerm_mssql_server" "server" {
  name                         = random_pet.azurerm_mssql_server_name.id
  resource_group_name          = var.rg
  location                     = var.location
  administrator_login          = var.admin_username
  administrator_login_password = var.sql_admin_password
  version                      = "12.0"
}

resource "azurerm_mssql_database" "db" {
  name      = var.sql_db_name
  server_id = azurerm_mssql_server.server.id
}