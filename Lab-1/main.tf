terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }
   required_version = ">= 1.1.0"
}
 
 
provider "azurerm" {
  features {}
}

module "rg" {
  source = "../modules/rg"
  rg_name = "rg-1"
  rg_location = "East Us"
}

module "storageacct" {
  source = "../modules/storage account"
  stg_name = {

    "stcacc" = {
        name = "stg07trails"
        rg_name = module.rg.rg_nameout
        location = module.rg.rg_locationout
        account_tier = "Standard"
        account_replication_type = "LRS"
    }
  }
  depends_on = [ module.rg ]
}