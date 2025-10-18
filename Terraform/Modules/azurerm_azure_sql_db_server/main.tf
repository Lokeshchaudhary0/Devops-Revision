resource "azurerm_sql_server" "sql_server" {
  for_each = var.sql_server
  name                         = each.value .name
  resource_group_name          = each.value.resource_group_name
  location                     = each.value.location
  version                      = each.value.version
  administrator_login          = each.value.administrator_login
  administrator_login_password = each.value.administrator_login_password

  tags = {
    environment = "Testing"
  }
}

# SQL Database
resource "azurerm_sql_database" "db_server" {
    for_each = var.db_server
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  server_name         = each.value.server_name
  edition             = each.value.edition

  tags = {
    environment = "Testing"
  }
}
