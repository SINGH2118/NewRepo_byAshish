

resource "azurerm_subnet" "bastion1" {

  name                 = "AzureBastionSubnet"
  resource_group_name  = "ashish-rg2"
  virtual_network_name = "ashish-vnet2"
  address_prefixes     = ["10.1.0.0/26"]

}

resource "azurerm_bastion_host" "bastion2" {
    for_each = var.bastion
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                 = "configuration"
    subnet_id            =  azurerm_subnet.bastion1.id
    public_ip_address_id =  data.azurerm_public_ip.pips[each.key].id
  }
}

