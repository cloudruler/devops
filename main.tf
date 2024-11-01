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

import {
  to = tfe_workspace.aws_connectivity
  id = "cloudruler/aws-connectivity"
}

import {
  to = tfe_workspace.aws_sandbox
  id = "cloudruler/aws-sandbox"
}

import {
  to = tfe_workspace.connectivity
  id = "cloudruler/connectivity"
}

import {
  to = tfe_workspace.devops
  id = "cloudruler/devops"
}

import {
  to = tfe_workspace.identity
  id = "cloudruler/identity"
}

import {
  to = tfe_workspace.sandbox
  id = "cloudruler/sandbox"
}

