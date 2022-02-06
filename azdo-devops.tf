
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
}

resource "azuredevops_git_repository" "devcontainers" {
  project_id = azuredevops_project.devops.id
  name       = "devcontainers"
  initialization {
    init_type = "Clean"
  }
}

resource "azuredevops_git_repository" "pipelines" {
  project_id = azuredevops_project.devops.id
  name       = "pipelines"
  initialization {
    init_type = "Clean"
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