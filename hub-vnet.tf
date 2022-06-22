provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "vicky-poc"
  location = "West Europe"
}

module "hub-vnet" {
  source              = "git::https://github.com/Azure/terraform-azurerm-vnet.git"
  vnet_name           = "hub-vnet"
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["10.0.0.0/16"]
  subnet_prefixes     = ["10.0.1.0/24"]
  subnet_names        = ["frontend"]

  //subnet_service_endpoints = {
  //  subnet1 = ["Microsoft.Storage"]
  //}

  tags = {
    environment = "dev"
    costcenter  = "it"
  }

  depends_on = [azurerm_resource_group.rg]
}
