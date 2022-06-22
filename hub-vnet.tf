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
  tags = {
    environment = "dev"
    costcenter  = "it"
  }

  depends_on = [azurerm_resource_group.rg]
}
