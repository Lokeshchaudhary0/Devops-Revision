resource "azurerm_container_registry" "acr" {
  for_each = var.acr

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  sku                 = each.value.sku
  admin_enabled       = each.value.admin_enabled

  # georeplications {
  #   location                 = each.value.georeplications.location
  #   zone_redundancy_enabled  = each.value.georeplications.zone_redundancy_enabled
  #   tags                     = each.value.georeplications.tags
  # }
}

output "acr_id" {
  value = { for k, v in azurerm_container_registry.acr : k => v.id }
}
