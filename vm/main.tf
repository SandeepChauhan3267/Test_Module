resource "azurerm_linux_virtual_machine" "vmcreate" {
    for_each = var.vms
  name                = each.value.name
  resource_group_name = data.azurerm_resource_group.rgs.name
  location            = each.value.location
  size                = "Standard_F2"
  admin_username      = "adminuser12345"
  admin_password      =  "Qwerty@12345"
  disable_password_authentication = false
  network_interface_ids = [data.azurerm_network_interface.niccreate.id]


dynamic "os_disk" {
  for_each = var.diskinfo
  content {
    caching              = os_disk.value.caching
    storage_account_type = os_disk.value.storage_account_type
  }
  
}

dynamic "source_image_reference" {
  for_each = var.sourceimageref
  content {
    publisher = source_image_reference.value.publisher
    offer     = source_image_reference.value.offer
    sku       = source_image_reference.value.sku
    version   = source_image_reference.value.version
  }

}
}
