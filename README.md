# az_route-table

## Usage

Ce module terraform permet de deployer une VM Azure,

## Example usage 

Pour voir un exemple d'utilisation de ce module ce réferer au dossier "example".
Cloner le repot et effectuer un terraform init/plan/apply afin de voir un exemple de déploiement.

> ne pas oublier de faire un terraform destroy après avoir fait des tests


## Providers

| Name | Version |
|------|---------|
| [azurerm](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs) | >= 3.11, < 4.0 |


## Resources provisionés

| Name | Type |
|------|------|
| [azurerm_route_table](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/route_table) | resource |
| [azurerm_subnet_route_table_association](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_route_table_association) | resource |


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| route_table_name | Nom du de la route table créée | `string` | null | yes |
| resourcegroup_name | Resource group name | `string` | null | yes |
| location | Région de déploiement | `string` | null | yes |
| routes | liste de routes à créer | <pre>list(object({<br>name = string<br>address_prefix = string<br>next_hop_type = string<br>next_hop_in_ip_address = string<br>}))</pre> | <pre>[<br>{<br>name = "route-to-internet"<br>address_prefix = "0.0.0.0/0"<br>next_hop_type = "Internet"<br>next_hop_in_ip_address = ""<br>}<br>]</pre> | no |
| disable_bgp_route_propagation | "Activer/Désactiver la propagation des routes vers l'environnement on-premise avec BGP" | `bool` | false | no |
| subnets_to_associate | "liste de subnet à associer à la table de routage" | <pre>list(object({<br>name = string<br>vnet_name = string<br>}))</pre> | <pre>[]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| route_table_id | "ID de la table de routage créée" |
| associated_subnet | "Infos des subnets associés à la table de routage" |

