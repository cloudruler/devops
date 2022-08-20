data "github_organization" "org" {
    name = var.github_organization
}

resource "github_repository" "devops" {
  name        = "devops"
  description = "Terraform for devops"
  lifecycle {
    prevent_destroy = true
  }
}

resource "github_repository" "infrastructure" {
  name        = "infrastructure"
  description = "Terraform for infrastructure"
  lifecycle {
    prevent_destroy = true
  }
}

resource "github_repository" "connectivity" {
  name        = "connectivity"
  description = "Terraform for connectivity"
  lifecycle {
    prevent_destroy = true
  }
}

resource "github_repository" "identity" {
  name        = "identity"
  description = "Terraform for identity"
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

resource "github_repository" "initialization" {
  name        = "initialization"
  description = "Terraform for initialization"
  lifecycle {
    prevent_destroy = true
  }
}

resource "github_repository" "sandbox" {
  name        = "sandbox"
  description = "Terraform for sandbox"
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

resource "github_repository" "aks-engine" {
  name        = "aks-engine"
  description = "Implement aks-engine"
  lifecycle {
    prevent_destroy = true
  }
}

resource "github_repository" "aws-connectivity" {
  name        = "aws-connectivity"
  description = "Terraform for aws-connectivity"
  lifecycle {
    prevent_destroy = true
  }
}

resource "github_repository" "aws-sandbox" {
  name        = "aws-sandbox"
  description = "Terraform for aws-sandbox"
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