module "az_route-table" {
  source             = "../../az_route-table"
  route_table_name   = var.route_table_name
  location           = var.location
  resourcegroup_name = var.resourcegroup_name
  routes             = var.routes
}