variable "networkinterfaces" {}

variable "ip-config" {
    type = list(object({
      name = string
      private_ip_address_allocation = string
    }))

}