terraform {
  required_version = ">= 1.6.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}


terraform {
  backend "azurerm" {
    resource_group_name  = "devops-rg1"
    tenant_id            = "0133099f-1aef-43e5-aff4-92411da359d0" # Can also be set via `ARM_TENANT_ID` environment variable. Azure CLI will fallback to use the connected tenant ID if not supplied.
    storage_account_name = "devopsstorage1001"                    # Can be passed via `-backend-config=`"storage_account_name=<storage account name>"` in the `init` command.
    container_name       = "tfstate"                              # Can be passed via `-backend-config=`"container_name=<container name>"` in the `init` command.
    key                  = "terraform.tfstate"                    # Can be passed via `-backend-config=`"key=<blob key name>"` in the `init` command.
  }
}
