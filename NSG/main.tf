resource "azurerm_network_security_group" "securitygroup" {
    for_each = var.NSGs
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
}