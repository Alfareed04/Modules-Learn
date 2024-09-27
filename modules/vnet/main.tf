
resource "azurerm_virtual_network" "vnet" {
    for_each = var.vnet_details
    name = each.value.vnet_name
    address_space = each.value.address_space
    location = each.value.rg_location
    resource_group_name  = each.value.rg_name
}