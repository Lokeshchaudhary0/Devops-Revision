resource "azurerm_key_vault" "kv" {
  for_each = var.kv
  name                        = each.value.name
  location                    = each.value.location
  resource_group_name         = each.value.resource_group_name
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  sku_name                    = each.value.sku_name
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false
}

data "azurerm_client_config" "current" {}

resource "azurerm_key_vault_secret" "keyvault_secret" {
  name         = "my-secret"
  value        = "TerraformIsCool123"
  key_vault_id = azurerm_key_vault.kv["kv1"].id
}
