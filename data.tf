data "azurerm_subnet" "subnets_to_associate" {
  for_each = var.subnets_to_associate != [] ? {
    for index, sub in var.subnets_to_associate :
    sub.name => sub
  } : {}
  name                 = each.value.name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = var.resourcegroup_name
}