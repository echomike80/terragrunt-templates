##
# Resources
##

resource "random_integer" "myapp_random_identifier" {
  min = 10000
  max = 99999
}

resource "azurerm_resource_group" "myapp" {
  count = var.create_resource_group ? 1 : 0

  location = var.location
  name     = coalesce(var.resource_group_name, format("rg-%s-%s", var.project, random_integer.myapp_random_identifier.result))
}

resource "azurerm_storage_account" "myapp" {
  resource_group_name = local.resource_group.name
  location            = local.resource_group.location
  name                = format("stor%s%s%stf", var.project, var.environment, random_integer.myapp_random_identifier.result)

  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "myapp" {
  name = "terraform-state" # only lowercase alphanumeric characters and hyphens allowed

  storage_account_name  = azurerm_storage_account.myapp.name
  container_access_type = "private"
}
