data "azurerm_resource_group" "rgs" {
  name = "om-rg1"
}

data "azurerm_subnet" "subnetdata" {
  name                 = "om-subnet1"
  virtual_network_name = "om-virtual-network1"
  resource_group_name  = data.azurerm_resource_group.rgs.name
}

data "azurerm_network_security_group" "nsgdata" {
  name                = "om-security-group"
  resource_group_name = data.azurerm_resource_group.rgs.name
}