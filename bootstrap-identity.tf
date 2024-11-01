resource "github_repository" "identity" {
  name        = "identity"
  description = "Holds all core secrets, keys, and certificates"
  lifecycle {
    prevent_destroy = true
  }
}

resource "tfe_workspace" "identity" {
  name              = github_repository.identity.name
  organization      = tfe_organization.cloudruler.name
  description       = github_repository.identity.description
  terraform_version = var.terraform_version
}

