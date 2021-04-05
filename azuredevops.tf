provider "azuredevops" {
  org_service_url = "https://dev.azure.com/cloudruler"
}

resource "azuredevops_project" "infrastructure" {
  name       = "infrastructure"
  description        = "Provisions all infrastructure, projects, repositories, etc."
  visibility         = "private"
  version_control    = "Git"
  work_item_template = "Agile"

  features = {
      boards    = "enabled"
      repositories = "enabled"
      pipelines = "enabled"
      testplans = "enabled"
      artifacts = "enabled"
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

resource "azuredevops_git_repository" "aks-engine" {
  project_id = azuredevops_project.infrastructure.id
  name       = "aks-engine"
  initialization {
    init_type = "Clean"
  }
}

resource "azuredevops_project" "devops" {
  name       = "devops"
  description        = "Tools for empowering development and operations"
  visibility         = "private"
  version_control    = "Git"
  work_item_template = "Agile"

  features = {
      boards    = "enabled"
      repositories = "enabled"
      pipelines = "enabled"
      testplans = "enabled"
      artifacts = "enabled"
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