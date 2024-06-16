variable "rgs" {}
variable "storageaccount" {}
variable "virtualnetworks" {}
variable "subnets" {}
variable "publicips" {}
variable "networkinterfaces" {}
variable "ip-config" {
    type = list(object({
      name = string
      private_ip_address_allocation = string
    }))

}
variable "NSGs" {}
variable "bastionhosts" {}
variable "ip_conf" {
    type = list(object({
      name = string
    }))
}
variable "vms" {}
variable "diskinfo" {
    type = list(object({
      caching = string
      storage_account_type= string 
    }))
}
variable "sourceimageref" {
    type = list(object({
      publisher = string
      offer = string
      sku = string
      version = string 
    }))
}