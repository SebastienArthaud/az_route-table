resource "azurerm_route_table" "az_route-table" {
  name                          = var.route_table_name
  location                      = var.location
  resource_group_name           = var.resourcegroup_name
  disable_bgp_route_propagation = var.disable_bgp_route_propagation

  dynamic "route" {
    for_each = var.routes != [] ? var.routes : []
    content {
      name                   = route.value.name
      address_prefix         = route.value.address_prefix
      next_hop_type          = route.value.next_hop_type
      next_hop_in_ip_address = route.value.next_hop_type == "VirtualAppliance" ? route.value.next_hop_in_ip_address : null
    }

  }
}

resource "azurerm_subnet_route_table_association" "subnet_association" {
  for_each       = data.azurerm_subnet.subnets_to_associate != [] ? data.azurerm_subnet.subnets_to_associate : null
  subnet_id      = each.value.id
  route_table_id = resource.azurerm_route_table.az_route-table.id
}