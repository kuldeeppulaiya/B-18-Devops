data "azurerm_subnet" "subnet" {
  name                 = "snet1"
  virtual_network_name = "vnet1"
  resource_group_name  = "rg1"
}
