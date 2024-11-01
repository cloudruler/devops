resource "github_repository" "devops" {
  name        = "devops"
  description = "Terraform for devops"
  lifecycle {
    prevent_destroy = true
  }
}

resource "tfe_workspace" "devops" {
  name              = github_repository.devops.name
  organization      = tfe_organization.cloudruler.name
  description       = github_repository.devops.description
  terraform_version = var.terraform_version
}
