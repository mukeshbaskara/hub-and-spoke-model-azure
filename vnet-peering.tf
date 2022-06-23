module "vnetpeering" {
  source               = "git::https://github.com/Azure/terraform-azurerm-vnetpeering.git"
  vnet_peering_names   = ["vnetpeering1"]
  vnet_names           = ["${module.hub-vnet.vnet_name}", "${module.spoke-vnet.vnet_name}"]
  resource_group_names = ["${azurerm_resource_group.rg.name}", "${azurerm_resource_group.rg.name}"]

  tags = {
    environment = "dev"
    costcenter  = "it"
  }
}
