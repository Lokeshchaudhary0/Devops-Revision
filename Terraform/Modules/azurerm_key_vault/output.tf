output "sql_password" {
  value     = azurerm_key_vault_secret.keyvault_secret.value
  sensitive = true
}
