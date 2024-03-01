route_table_name   = "rt-seb"
resourcegroup_name = "rg-seb"
location           = "uksouth"
routes = [
  {
    name                   = "default-route"
    address_prefix         = "0.0.0.0/0"
    next_hop_type          = "Internet"
    next_hop_in_ip_address = ""
  },
  {
    name                   = "default-to-on_premise"
    address_prefix         = "172.16.0.0/24"
    next_hop_type          = "VirtualNetworkGateway"
    next_hop_in_ip_address = ""
  }
]