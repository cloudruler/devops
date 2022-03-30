
resource "azuredevops_project" "infrastructure" {
  name               = "infrastructure"
  description        = "Provisions all infrastructure, projects, repositories, etc."
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

resource "azuredevops_serviceendpoint_azurerm" "infrastructure" {
  project_id                = azuredevops_project.infrastructure.id
  service_endpoint_name     = "cloudruler"
  description               = "Cloud Ruler subscription"
  azurerm_spn_tenantid      = local.tenant_id
  azurerm_subscription_id   = local.subscription_id
  azurerm_subscription_name = "cloudruler"
  credentials {
    serviceprincipalid  = data.azuread_service_principal.vault_automation.application_id
    serviceprincipalkey = data.azurerm_key_vault_secret.arm_connector_sp.value
  }
}

data "azurerm_key_vault_secret" "terraform_cloud_api" {
  name         = "terraform-cloud-cloudruler-organization-api-token"
  key_vault_id = data.azurerm_key_vault.cloudruler.id
}

resource "azuredevops_serviceendpoint_generic" "terraform_cloud" {
  project_id            = azuredevops_project.infrastructure.id
  server_url            = "https://app.terraform.io/api/v2"
  password              = data.azurerm_key_vault_secret.terraform_cloud_api.value
  service_endpoint_name = "terraform-cloud-api"
  description           = "Managed by Terraform"
}

resource "azuredevops_git_repository" "initialization" {
  project_id = azuredevops_project.infrastructure.id
  name       = "initialization"
  default_branch = "refs/heads/main"
  initialization {
    init_type = "Clean"
  }
  lifecycle {
    prevent_destroy = true
  }
}

resource "azuredevops_git_repository" "management" {
  project_id = azuredevops_project.infrastructure.id
  name       = "management"
  default_branch = "refs/heads/main"
  initialization {
    init_type = "Clean"
  }
  lifecycle {
    prevent_destroy = true
  }
}

resource "azuredevops_git_repository" "infrastructure" {
  project_id = azuredevops_project.infrastructure.id
  name       = "infrastructure"
  default_branch = "refs/heads/main"
  initialization {
    init_type = "Clean"
  }
  lifecycle {
    prevent_destroy = true
  }
}

resource "azuredevops_git_repository" "scripts" {
  project_id = azuredevops_project.infrastructure.id
  name       = "scripts"
  default_branch = "refs/heads/main"
  initialization {
    init_type = "Clean"
  }
  lifecycle {
    prevent_destroy = true
  }
}

resource "azuredevops_git_repository" "sandbox" {
  project_id = azuredevops_project.infrastructure.id
  name       = "sandbox"
  default_branch = "refs/heads/main"
  initialization {
    init_type = "Clean"
  }
  lifecycle {
    prevent_destroy = true
  }
}

resource "azuredevops_git_repository" "identity" {
  project_id = azuredevops_project.infrastructure.id
  name       = "identity"
  default_branch = "refs/heads/main"
  initialization {
    init_type = "Clean"
  }
  lifecycle {
    prevent_destroy = true
  }
}

resource "azuredevops_git_repository" "devops" {
  project_id = azuredevops_project.infrastructure.id
  name       = "devops"
  default_branch = "refs/heads/main"
  initialization {
    init_type = "Clean"
  }
  lifecycle {
    prevent_destroy = true
  }
}

resource "azuredevops_git_repository" "connectivity" {
  project_id = azuredevops_project.infrastructure.id
  name       = "connectivity"
  default_branch = "refs/heads/main"
  initialization {
    init_type = "Clean"
  }
  lifecycle {
    prevent_destroy = true
  }
}

resource "azuredevops_git_repository" "aks_engine" {
  project_id = azuredevops_project.infrastructure.id
  name       = "aks-engine"
  default_branch = "refs/heads/main"
  initialization {
    init_type = "Clean"
  }
  lifecycle {
    prevent_destroy = true
  }
}

resource "azuredevops_git_repository" "images" {
  project_id = azuredevops_project.infrastructure.id
  name       = "images"
  default_branch = "refs/heads/main"
  initialization {
    init_type = "Clean"
  }
  lifecycle {
    prevent_destroy = true
  }
}