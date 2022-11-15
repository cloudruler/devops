terraform {
  required_providers {
    azuread = {
      source = "hashicorp/azuread"
      version = "2.30.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.31.0"
    }
    azuredevops = {
      source  = "microsoft/azuredevops"
      version = ">=0.3.0"
    }
    github = {
      source = "integrations/github"
      version = "5.8.0"
    }
    tfe = {
      source = "hashicorp/tfe"
      version = "0.38.0"
    }
    random = {
      source = "hashicorp/random"
      version = "3.1.0"
    }
  }
  cloud {
    organization = "cloudruler"
    workspaces {
      name = "devops"
    }
  }
  # backend "azurerm" {
  #   resource_group_name  = "rg-identity"
  #   storage_account_name = "cloudruler"
  #   container_name       = "tfstates"
  #   key                  = "devops.tfstate"
  # }
  required_version = ">= 0.14.7"
}

provider "github" {
  owner = var.github_organization
}

provider "azurerm" {
  features {}
}

provider "tfe" {
}
provider "random" {
}