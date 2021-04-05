provider "azurerm" {
  features {}
}

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

# resource "azurerm_storage_account" "st" {
#   name                     = "cloudruler"
#   resource_group_name      = azurerm_resource_group.rg.name
#   location                 = azurerm_resource_group.rg.location
#   account_kind             = "StorageV2"
#   account_tier             = "Standard"
#   account_replication_type = "LRS"
#   access_tier              = "Cool"
#   min_tls_version          = "TLS1_2"
# }
