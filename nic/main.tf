resource "azurerm_network_interface" "example" {
    for_each = var.networkinterfaces
  name                = each.value.name
  location            = each.value.location
  resource_group_name = data.azurerm_resource_group.rgs.name

  dynamic "ip_configuration" {
    for_each = var.ip-config
    content {
      name = ip_configuration.value.name
      subnet_id = data.azurerm_subnet.subnet.id
      private_ip_address_allocation = ip_configuration.value.private_ip_address_allocation
    }
  }
  
}