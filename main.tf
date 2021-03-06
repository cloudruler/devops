provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "rg-devops"
  location = var.location
}

#Logic App which creates workspaces based on a given 

resource "azurerm_logic_app_workflow" "terraform_init_workspace" {
  name                = "logic-tfc-init-workspace"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}