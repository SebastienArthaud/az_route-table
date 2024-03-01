output "route_table_id" {
  description = "ID de la table de routage créée"
  value       = resource.azurerm_route_table.az_route-table.id
}

output "associated_subnet" {
  description = "Infos des subnets associés à la table de routage"
  value       = resource.azurerm_subnet_route_table_association.subnet_association != null ? resource.azurerm_subnet_route_table_association.subnet_association : null
}