
module "rg" {
  source          = "../../modules/resource_group"
  rgs = var.rgs
}


module "vnet" {
  depends_on       = [module.rg]
  source           = "../../modules/virtual_network"
  virtual_networks = var.vnets
}


module "subnet" {
  depends_on    = [module.vnet]
  source        = "../../modules/subnet"
  subnets       = var.snets

}


module "pips" {
  depends_on = [module.rg]
  source     = "../../modules/public_ip"
  public_ips = var.pips
}

module "nics" {
  depends_on        = [module.pips, module.subnet]
  source            = "../../modules/network_interface"
  network_interface = var.nics
}

module "vms" {
  depends_on       = [module.nics]
  source           = "../../modules/linux_virtual_machine"
  virtual_machines = var.vms
}

module "bastion" {
  depends_on = [module.rg, module.vnet, module.subnet, module.pips]
  source     = "../../modules/Bastion"
  bastion    = var.bastion
}

module "nsg" {
  depends_on = [module.rg, module.vnet, module.subnet]
  source = "../../modules/network_security_group"
  nsgs = var.nsgs
}

