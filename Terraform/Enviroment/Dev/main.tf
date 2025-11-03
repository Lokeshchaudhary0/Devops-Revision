module "rg" {
  source = "../../Modules/azurerm_resource_group"
  rgs    = var.rgs
}
# module "subnet" {
#   depends_on = [module.virtual_network]
#   source     = "../../Modules/azurerm_subnet"
#   subnet     = var.subnet
# }
# module "virtual_network" {
#   depends_on = [module.rg]
#   source     = "../../Modules/azurerm_virtual_network"
#   vnet       = var.vnet
# }
# module "storage_account" {
#   depends_on      = [module.rg]
#   source          = "../../Modules/Storage_Account"
#   loukesh-storage = var.storage
# }
# module "vm" {
#   depends_on = [module.subnet]
#   source     = "../../Modules/Virtual_Machine"
#   vms        = var.vms

# }

module "acr" {
  depends_on = [module.rg]
  source     = "../../Modules/azurerm_acr"
  acr        = var.acr
}

module "aks" {
  depends_on = [module.rg]
  source     = "../../Modules/azurerm_kubernets_services"
  aks        = var.aks
}

module "db_server" {
  depends_on = [module.sql_server]
  source     = "../../Modules/azurerm_azure_sql_db_server"
  sql_server_map = module.sql_server.sql_server_map
  db_server  = var.db_server

}
module "sql_server" {
  depends_on = [module.rg]
  source     = "../../Modules/azurerm_azure_sql_server"
  sql_server  = var.sql_server
  
}
module "kv" {
  source = "../../Modules/azurerm_key_vault"
  kv     = var.kv
}
resource "azurerm_role_assignment" "aks_acr_attach" {
  principal_id         = module.aks.aks_principal_id["aks1"]
  role_definition_name = "AcrPull"
  scope                = module.acr.acr_id["acr1"]
}