resource "azurerm_bastion_host" "ABH" {
    for_each = var.bastionhosts
  name                = each.value.name
  location            = each.value.location
  resource_group_name = data.azurerm_resource_group.rgs.name

  dynamic "ip_configuration" {
    for_each = var.ip_conf
    content {
    name                 = ip_configuration.value.name
    subnet_id            = data.azurerm_subnet.subnet.id
    public_ip_address_id = data.azurerm_public_ip.pipdata.id
    }
    
  }
}