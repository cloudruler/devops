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
}

resource "azuredevops_serviceendpoint_azurerm" "infrastructure" {
  project_id                = azuredevops_project.infrastructure.id
  service_endpoint_name     = "cloudruler"
  description               = "Cloud Ruler subscription"
  azurerm_spn_tenantid      = local.tenant_id
  azurerm_subscription_id   = local.subscription_id
  azurerm_subscription_name = "cloudruler"
  credentials {
    serviceprincipalid  = "1e3fd996-8372-4ce4-8cbc-9406340e495b"
    serviceprincipalkey = data.azurerm_key_vault_secret.arm_connector_sp.value
  }
}

resource "azuredevops_git_repository" "initialization" {
  project_id = azuredevops_project.infrastructure.id
  name       = "initialization"
  initialization {
    init_type = "Clean"
  }
}

resource "azuredevops_git_repository" "management" {
  project_id = azuredevops_project.infrastructure.id
  name       = "management"
  initialization {
    init_type = "Clean"
  }
}

resource "azuredevops_git_repository" "infrastructure" {
  project_id = azuredevops_project.infrastructure.id
  name       = "infrastructure"
  initialization {
    init_type = "Clean"
  }
}

resource "azuredevops_git_repository" "scripts" {
  project_id = azuredevops_project.infrastructure.id
  name       = "scripts"
  initialization {
    init_type = "Clean"
  }
}

resource "azuredevops_git_repository" "sandbox" {
  project_id = azuredevops_project.infrastructure.id
  name       = "sandbox"
  initialization {
    init_type = "Clean"
  }
}

resource "azuredevops_git_repository" "terraform-cloudruler-common" {
  project_id = azuredevops_project.infrastructure.id
  name       = "terraform-cloudruler-common"
  initialization {
    init_type = "Clean"
  }
}

resource "azuredevops_git_repository" "identity" {
  project_id = azuredevops_project.infrastructure.id
  name       = "identity"
  initialization {
    init_type = "Clean"
  }
}

resource "azuredevops_git_repository" "devops" {
  project_id = azuredevops_project.infrastructure.id
  name       = "devops"
  initialization {
    init_type = "Clean"
  }
}

resource "azuredevops_git_repository" "connectivity" {
  project_id = azuredevops_project.infrastructure.id
  name       = "connectivity"
  initialization {
    init_type = "Clean"
  }
}

resource "azuredevops_git_repository" "aks_engine" {
  project_id = azuredevops_project.infrastructure.id
  name       = "aks-engine"
  initialization {
    init_type = "Clean"
  }
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

resource "azuredevops_project" "dev" {
  name               = "dev"
  description        = "Sandbox for practicing coding"
  visibility         = "private"
  version_control    = "Git"
  work_item_template = "Basic"

  features = {
    boards       = "enabled"
    repositories = "enabled"
    pipelines    = "enabled"
    testplans    = "enabled"
    artifacts    = "enabled"
  }
}

resource "azuredevops_git_repository" "dev" {
  project_id = azuredevops_project.dev.id
  name       = "dev"
  initialization {
    init_type = "Clean"
  }
}

resource "azuredevops_git_repository" "python" {
  project_id = azuredevops_project.dev.id
  name       = "python"
  initialization {
    init_type = "Clean"
  }
}

resource "azuredevops_git_repository" "dotnet" {
  project_id = azuredevops_project.dev.id
  name       = "dotnet"
  initialization {
    init_type = "Clean"
  }
}

resource "azuredevops_git_repository" "java" {
  project_id = azuredevops_project.dev.id
  name       = "java"
  initialization {
    init_type = "Clean"
  }
}

resource "azuredevops_serviceendpoint_azurecr" "cloudruler" {
  project_id                = azuredevops_project.devops.id
  service_endpoint_name     = "cloudruler.azurecr.io"
  description               = "Cloud Ruler container registry"
  resource_group            = "rg-devops"
  azurecr_spn_tenantid      = local.tenant_id
  azurecr_name              = "cloudruler"
  azurecr_subscription_id   = local.subscription_id
  azurecr_subscription_name = "cloudruler"
}