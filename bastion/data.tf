data "azurerm_resource_group" "rgs" {
  name = "om-rg1"
}

data "azurerm_subnet" "subnet" {
  name                 = "AzureBastionSubnet"
  virtual_network_name = "om-virtual-network1"
  resource_group_name  = data.azurerm_resource_group.rgs.name
}

data "azurerm_public_ip" "pipdata" {
  name                = "om-PublicIp1"
  resource_group_name = data.azurerm_resource_group.rgs.name
}