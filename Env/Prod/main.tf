module "mrg" {
  source = "../../resourcegroup"
  rgs    = var.rgs

}


module "msa" {
  source         = "../../storageaccount"
  storageaccount = var.storageaccount
  depends_on     = [module.mrg]
}


module "mvn" {
  source          = "../../virtualnetwork"
  virtualnetworks = var.virtualnetworks
  depends_on      = [module.mrg, module.msa]
}

module "msubnet" {
  source = "../../subnet"
  subnets = var.subnets
  depends_on = [ module.mrg, module.msa, module.mvn ]
  
}

module "mpip" {
  source     = "../../pip"
  publicips  = var.publicips
  depends_on = [module.mrg, module.msa, module.mvn, module.msubnet]
}

module "mnic" {
  source            = "../../nic"
  networkinterfaces = var.networkinterfaces
  ip-config = [
    {
      name                         = "nic-ip-config"
      private_ip_address_allocation = "Dynamic"
    }
  ]
  depends_on        = [module.mrg, module.msa, module.mvn,module.msubnet, module.mpip]

}


module "mnsg" {
  source     = "../../NSG"
  NSGs       = var.NSGs
  depends_on = [module.mrg, module.msa, module.mvn,module.msubnet, module.mpip, module.mnic]
}


module "mbastion" {
  source       = "../../bastion"
  bastionhosts = var.bastionhosts
  ip_conf      = [
    {
      name = "AzureBastionConfig"
    }
  ]
  depends_on   = [module.mrg, module.msa, module.mvn,module.msubnet, module.mpip, module.mnic, module.mnsg]
}


module "mvm" {
  source         = "../../vm"
  vms            = var.vms
  diskinfo       = [ 
    {
      caching = "ReadWrite"
      storage_account_type = "Standard_LRS"
    }
  ]
  sourceimageref = [ 
    {
      publisher = "Canonical"
      offer = "0001-com-ubuntu-server-focal"
      sku = "20_04-lts"
      version = "latest"
    }
  ]
  depends_on     = [module.mrg, module.msa, module.mvn,module.msubnet, module.mpip, module.mnic, module.mnsg, module.mbastion]
}