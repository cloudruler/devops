
resource "azurerm_resource_group" "rg" {
  name     = "rg-devops"
  location = var.location
}

resource "azurerm_container_registry" "cr" {
  count               = 1
  name                = "cloudruler"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = "Basic"
}

