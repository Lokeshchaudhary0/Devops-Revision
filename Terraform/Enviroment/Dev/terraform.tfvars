rgs = {
  rg1 = {
    name     = "rg-loukesh"
    location = "centralindia"
  }
}

vnet = {
  vnet1 = {
    name                = "loukeshvnet"
    resource_group_name = "rg-loukesh"
    location            = "centralindia"
    address_space       = ["10.0.0.0/16"]
  }
}

subnet = {
  subnet1 = {
    name             = "frontend-subnet"
    rg_name          = "rg-loukesh"
    vnet_name        = "loukeshvnet"
    address_prefixes = ["10.0.1.0/24"]
  }
  subnet2 = {
    name             = "backend-subnet"
    rg_name          = "rg-loukesh"
    vnet_name        = "loukeshvnet"
    address_prefixes = ["10.0.2.0/24"]
  }

}
storage = {
  stoarge1 = {
    name                     = "staoragebeta"
    location                 = "centralindia"
    resource_group_name      = "rg-loukesh"
    account_replication_type = "LRS"
  }
}
vms = {
  vm1 = {
    subnet_name          = "frontend-subnet"
    virtual_network_name = "loukeshvnet"
    resource_group_name  = "rg-loukesh"
    nic_name             = "vm1-nic"
    location             = "centralindia"
    vm_name              = "loukeshvm1"
    size                 = "Standard_F2"
  }
  vm2 = {
    subnet_name          = "backend-subnet"
    virtual_network_name = "loukeshvnet"
    resource_group_name  = "rg-loukesh"
    nic_name             = "vm2-nic"
    location             = "centralindia"
    vm_name              = "loukeshvm"
    size                 = "Standard_F2"
  }
}
nic = {
  nic1 = {
    name                = "vm1-nic"
    location            = "centralindia"
    resource_group_name = "rg-loukesh"
  }
  nic2 = {
    name                = "vm2-nic"
    location            = "centralindia"
    resource_group_name = "rg-loukesh"
  }
}

acr = {
  acr1 = {
    name                = "containerRegistryloukesh"
    resource_group_name = "rg-loukesh"
    location            = "centralindia"
    sku                 = "Standard"
    admin_enabled       = false
    georeplications = {
      location                = "centralindia"
      zone_redundancy_enabled = true
      tags                    = {}
    }
  }
}
aks = {
  aks1 = {
    name                = "azure-aks"
    resource_group_name = "rg-loukesh"
    location            = "centralindia"
    default_node_pool = {
      name       = "default"
      node_count = 1
      vm_size    = "Standard_A2_v2"
    }
    identity = {
      type = "SystemAssigned"
    }
    tags = {
      Environment = "Production"
    }
  }
}

sql_server = {
  sqlserver1 = {
    name                         = "loukeshsqlserver"
    resource_group_name          = "rg-loukesh"
    location                     = "centralindia"
    version                      = "12.0"
    administrator_login          = "adminuser"
    administrator_login_password = "P@ssw0rd123"
  }
}
db_server = {
  db1 = {
    name                = "loukeshsqldb"
    server_name         = "loukeshsqlserver"
    resource_group_name = "rg-loukesh"
    location            = "centralindia"
    edition            =  "Basic"
  }
}