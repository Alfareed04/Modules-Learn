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
  rg_name = "rg-2"
  rg_location = "East Us"
}

module "vnet" {
  source = "../modules/vnet"
  vnet_details = {
    "vnet" = {
        vnet_name = "vnet"
        address_space =["10.0.0.0/16"]
        rg_name = module.rg.rg_nameout
        rg_location =module.rg.rg_locationout

    }
  }
  depends_on = [ module.rg ]
}
