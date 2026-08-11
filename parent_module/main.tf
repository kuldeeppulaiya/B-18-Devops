module "rg" {
  source = "../child_module/azure_rg"
  rg     = var.rg

}


module "vnets" {

  depends_on = [module.rg]
  source     = "../child_module/azure_vnets"
  vnets      = var.vnets
}


module "snets" {

  depends_on = [module.vnets]
  source     = "../child_module/azure_snets"
  snets      = var.snets
}

module "pips" {

  depends_on = [module.rg]
  source     = "../child_module/azure_public_ip"
  pips       = var.pips
}

module "vms" {

  depends_on = [module.rg]
  source     = "../child_module/azure_vm_nic"
  vms        = var.vms
}