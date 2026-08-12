rg = {
  rg1 = {
    name     = "rg1"
    location = "centralindia"
  }


}



vnets = {

  vnet1 = {
    name                = "vnet1"
    location            = "centralindia"
    resource_group_name = "rg1"
    address_space       = ["10.0.0.0/16"]
  }

}



snets = {

  snet1 = {
    name                 = "snet1"
    resource_group_name  = "rg1"
    virtual_network_name = "vnet1"
    address_prefixes     = ["10.0.1.0/24"]
  }

  snet2 = {
    name                 = "snet2"
    resource_group_name  = "rg1"
    virtual_network_name = "vnet1"
    address_prefixes     = ["10.0.2.0/24"]
  }
}


pips = {
  pip1 = {
    name                = "pip1"
    resource_group_name = "rg1"
    location            = "centralindia"
    allocation_method   = "Static"

  }

}

vms = {


  vms1 = {
    name_pip             = "pip1"
    resource_group_name  = "rg1"
    location             = "centralindia"
    allocation_method    = "Static"
    name_vms             = "frontend-vm-vms"
    resource_group_name  = "rg1"
    name_subnet          = "snet1"
    virtual_network_name = "vnet1"
    name_ip_config       = "Devops_ip"
    name_vm              = "vm1"
    size_vm              = "Standard_D2s_v3"
    admin_username       = "adminuser"
    admin_password       = "Password@123"

  }
}