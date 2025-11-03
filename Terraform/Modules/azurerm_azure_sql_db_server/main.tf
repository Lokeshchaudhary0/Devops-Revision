resource "azurerm_mssql_database" "db_server" {
  for_each = var.db_server
  name         = each.value.name
  server_id    = var.sql_server_map[each.value.server_name]
  collation    = each.value.collection
  license_type = each.value.license_type
  max_size_gb  = each.value.max_size_gb
  sku_name     = each.value.sku_name
  enclave_type = each.value.enclave_type
  storage_account_type = each.value.storage_account_type


  tags = {
    environment = "Testing"
  }
}

