data "github_organization" "org" {
    name = var.github_organization
}

resource "github_repository" "initialization" {
  name        = "initialization"
  description = "Terraform for initialization"
  lifecycle {
    prevent_destroy = true
  }
}

resource "github_repository" "infrastructure" {
  name        = "infrastructure"
  description = "Has workspaces and devcontainer"
  lifecycle {
    prevent_destroy = true
  }
}

resource "github_repository" "images" {
  name        = "images"
  description = "Terraform for images"
  lifecycle {
    prevent_destroy = true
  }
}

resource "github_repository" "scripts" {
  name        = "scripts"
  description = "Terraform for scripts"
  lifecycle {
    prevent_destroy = true
  }
}

resource "github_repository" "slido" {
  name        = "slido"
  description = "Code for working with slido"
  lifecycle {
    prevent_destroy = true
  }
}

resource "github_repository" "aks_engine" {
  name        = "aks-engine"
  description = "Scripts for building AKS"
  lifecycle {
    prevent_destroy = true
  }
}
