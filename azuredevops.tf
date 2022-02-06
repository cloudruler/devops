provider "azuredevops" {
  org_service_url = "https://dev.azure.com/cloudruler"
}

locals {
  tenant_id       = "c17f8a71-76c6-4e70-bd08-fb10ead2bf68"
  subscription_id = "2fb80bcc-8430-4b66-868b-8253e48a8317"
}

data "azurerm_key_vault" "cloudruler" {
  name                = "cloudruler"
  resource_group_name = "rg-identity"
}

data "azurerm_key_vault_secret" "arm_connector_sp" {
  name         = "infrastructure-automation-arm-connector-secret"
  key_vault_id = data.azurerm_key_vault.cloudruler.id
}

data "azuread_service_principal" "vault_automation" {
  display_name = "vault-automation"
}

