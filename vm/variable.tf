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

  