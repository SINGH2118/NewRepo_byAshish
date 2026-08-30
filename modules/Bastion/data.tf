data "azurerm_public_ip" "pips" {
    for_each = var.bastion
    name = each.value.public_ip_name
    resource_group_name = each.value.resource_group_name
}
