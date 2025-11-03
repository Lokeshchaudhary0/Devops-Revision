resource "azurerm_kubernetes_cluster" "aks" {
  for_each = var.aks

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  dns_prefix          = each.value.name  # or provide a separate dns_prefix if needed

  default_node_pool {
    name       = each.value.default_node_pool.name
    node_count = each.value.default_node_pool.node_count
    vm_size    = each.value.default_node_pool.vm_size
  }

  identity {
    type = each.value.identity.type
  }

  tags = each.value.tags
}
output "aks_principal_id" {
  value = { for k, v in azurerm_kubernetes_cluster.aks : k => v.kubelet_identity[0].object_id }
}