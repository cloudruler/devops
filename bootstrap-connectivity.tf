resource "github_repository" "connectivity" {
  name        = "connectivity"
  description = "Holds resources related to DNS, hub networks, firewalls, public IPs, etc."
  lifecycle {
    prevent_destroy = true
  }
}

resource "tfe_workspace" "connectivity" {
  name              = github_repository.connectivity.name
  organization      = tfe_organization.cloudruler.name
  description       = github_repository.connectivity.description
  terraform_version = var.terraform_version
}
