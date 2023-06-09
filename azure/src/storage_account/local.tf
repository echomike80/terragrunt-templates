locals {
  resource_group = {
    name     = try(azurerm_resource_group.myapp[0].name, var.resource_group_name)
    location = var.location
  }
}
