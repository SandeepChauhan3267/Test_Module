data "azurerm_resource_group" "rgs" {
  name = "om-rg1"
}

data "azurerm_subnet" "subnet" {
  name                 = "om-subnet1"
  virtual_network_name = "om-virtual-network1"
  resource_group_name  = "om-rg1"
}
