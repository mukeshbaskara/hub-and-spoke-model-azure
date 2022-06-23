resource "azurerm_subnet" "subnet1" {
  name                 = "subnet1"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = module.spoke-vnet.vnet_name
  address_prefixes     = ["10.1.1.0/24"]
}
