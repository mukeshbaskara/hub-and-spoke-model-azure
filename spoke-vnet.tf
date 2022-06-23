module "spoke-vnet" {
  source              = "git::https://github.com/Azure/terraform-azurerm-vnet.git"
  vnet_name           = "spoke-vnet"
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["10.1.0.0/16"]
  subnet_names        = []
  tags = {
    environment = "dev"
    costcenter  = "it"
  }

  depends_on = [azurerm_resource_group.rg]
}
