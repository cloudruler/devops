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
  name         = "vault-automation-secret"
  key_vault_id = data.azurerm_key_vault.cloudruler.id
}

data "azuread_service_principal" "vault_automation" {
  display_name = "vault-automation"
}



resource "azuredevops_project" "devops" {
  name               = "devops"
  description        = "Tools for empowering development and operations"
  visibility         = "private"
  version_control    = "Git"
  work_item_template = "Agile"

  features = {
    boards       = "enabled"
    repositories = "enabled"
    pipelines    = "enabled"
    testplans    = "enabled"
    artifacts    = "enabled"
  }
  lifecycle {
    prevent_destroy = true
  }
}

resource "azuredevops_git_repository" "devcontainers" {
  project_id = azuredevops_project.devops.id
  name       = "devcontainers"
  default_branch = "refs/heads/main"
  initialization {
    init_type = "Clean"
  }
  lifecycle {
    prevent_destroy = true
  }
}

resource "azuredevops_git_repository" "pipelines" {
  project_id = azuredevops_project.devops.id
  name       = "pipelines"
  default_branch = "refs/heads/main"
  initialization {
    init_type = "Clean"
  }
  lifecycle {
    prevent_destroy = true
  }
}

resource "azuredevops_serviceendpoint_dockerregistry" "cloudruler" {
    project_id             = azuredevops_project.devops.id
    service_endpoint_name  = "cloudruler.azurecr.io"
    docker_registry      = "https://cloudruler.azurecr.io/v1"
    docker_username        = data.azuread_service_principal.vault_automation.application_id
    docker_password        = data.azurerm_key_vault_secret.arm_connector_sp.value
    registry_type          = "Others"
}