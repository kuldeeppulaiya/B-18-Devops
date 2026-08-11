resource "azurerm_network_interface" "nic" {
  for_each            = var.vms
  name                = each.value.name_vms
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = each.value.name_ip_config
    subnet_id                     = data.azurerm_subnet.snets[each.key].id
    public_ip_address_id          = data.azurerm_public_ip.pips[each.key].id
    private_ip_address_allocation = "Dynamic"
  }
}
resource "azurerm_linux_virtual_machine" "vms" {
  for_each            = var.vms
  name                = each.value.name_vm
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  size                = each.value.size_vm
  admin_username      = each.value.admin_username
  admin_password      = each.value.admin_password
  network_interface_ids = [
    azurerm_network_interface.nic[each.key].id,
  ]
  disable_password_authentication = false



  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canovmsal"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
}