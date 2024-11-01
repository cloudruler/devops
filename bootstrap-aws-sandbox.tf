resource "github_repository" "aws_sandbox" {
  name        = "aws-sandbox"
  description = "Terraform for aws-sandbox"
  lifecycle {
    prevent_destroy = true
  }
}

resource "tfe_workspace" "aws_sandbox" {
  name              = github_repository.aws_sandbox.name
  organization      = tfe_organization.cloudruler.name
  description       = github_repository.aws_sandbox.description
  terraform_version = var.terraform_version
  execution_mode    = "local"
}
