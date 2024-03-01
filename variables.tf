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
  default = [
    {
      name                   = "route-to-internet"
      address_prefix         = "0.0.0.0/0"
      next_hop_type          = "Internet"
      next_hop_in_ip_address = ""
    }
  ]
}

variable "disable_bgp_route_propagation" {
  type        = bool
  description = "Activer/Désactiver la propagation des routes vers l'environnement on-premise avec BGP"
  default     = false
}

variable "subnets_to_associate" {
  type = list(object({
    name      = string
    vnet_name = string
  }))
  description = "liste de subnet à associer à la table de routage"
  default     = []

}