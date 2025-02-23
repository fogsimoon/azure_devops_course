# Create the Linux App Service Plan
resource "azurerm_service_plan" "appserviceplan" {
  name                = var.asp_name
  location            = var.location
  resource_group_name = var.rg
  os_type             = "Linux"
  sku_name            = "F1"
}

# Create the web app, pass in the App Service Plan ID
resource "azurerm_linux_web_app" "webapp" {
  name                = var.app_name
  location            = var.location
  resource_group_name = var.rg
  service_plan_id     = azurerm_service_plan.appserviceplan.id
  depends_on          = [azurerm_service_plan.appserviceplan]
  https_only          = true
  site_config {
    always_on           = false
    minimum_tls_version = "1.2"
    application_stack {
      node_version = "16-lts"
    }
  }
}

#  Deploy code from a public GitHub repo
resource "azurerm_app_service_source_control" "sourcecontrol" {
  app_id                 = azurerm_linux_web_app.webapp.id
  repo_url               = "https://github.com/Azure-Samples/nodejs-docs-hello-world"
  branch                 = "main"
  use_manual_integration = true
  use_mercurial          = false
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