variable "bastionhosts" {}
variable "ip_conf" {
    type = list(object({
      name = string
    }))
}