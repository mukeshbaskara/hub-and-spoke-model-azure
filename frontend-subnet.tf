resource "azurerm_subnet" "frontend" {
  name                 = "frontend"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = module.hub-vnet.name
  address_prefixes     = ["10.254.0.0/24"]
}
