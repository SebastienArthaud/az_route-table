variable "resourcegroup_name" {
  type        = string
  description = "Resource group name"
}

variable "location" {
  type        = string
  description = "Région de déploiement"
}

variable "route_table_name" {
  type        = string
  description = "Nom du VNET"
}


variable "routes" {
  type = list(object({
    name                   = string
    address_prefix         = string
    next_hop_type          = string
    next_hop_in_ip_address = string
  }))
  description = "liste de subnet à créer"
}