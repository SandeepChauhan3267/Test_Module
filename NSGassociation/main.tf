resource "azurerm_subnet_network_security_group_association" "nsgassociation" {
  subnet_id                 = data.azurerm_subnet.subnetdata.id
  network_security_group_id = data.azurerm_network_security_group.nsgdata.id
}