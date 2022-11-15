resource "github_repository" "sandbox" {
  name        = "sandbox"
  description = "Throwaway subscription"
  lifecycle {
    prevent_destroy = true
  }
}

resource "tfe_workspace" "sandbox" {
  name           = github_repository.sandbox.name
  organization   = tfe_organization.cloudruler.name
  description    = github_repository.sandbox.description
}