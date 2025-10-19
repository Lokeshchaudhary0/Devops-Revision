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
