
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
