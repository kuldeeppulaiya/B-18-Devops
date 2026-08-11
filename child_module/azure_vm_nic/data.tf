data "azurerm_public_ip" "pips" {
  for_each            = var.vms
  name                = each.value.name_pip
  resource_group_name = each.value.resource_group_name
}


data "azurerm_subnet" "snets" {
  for_each             = var.vms
  name                 = each.value.name_subnet
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}
