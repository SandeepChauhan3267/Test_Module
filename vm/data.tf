data "azurerm_resource_group" "rgs" {
  name = "om-rg1"
}

data "azurerm_network_interface" "niccreate" {
  name                = "om-nic1"
  resource_group_name = "om-rg1"
}
