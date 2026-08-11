resource "azurerm_network_interface" "nic" {
  name                = "frontend-vm-nic"
  location            = "centralindia"
  resource_group_name = "rg1"

  ip_configuration {
    name                          = "dhondu"
    subnet_id                     = data.azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}