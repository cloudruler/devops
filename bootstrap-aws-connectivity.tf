resource "github_repository" "aws_connectivity" {
  name        = "aws-connectivity"
  description = "Terraform for aws-connectivity"
  lifecycle {
    prevent_destroy = true
  }
}

resource "tfe_workspace" "aws_connectivity" {
  name           = github_repository.aws_connectivity.name
  organization   = tfe_organization.cloudruler.name
  description    = github_repository.aws_connectivity.description
}
