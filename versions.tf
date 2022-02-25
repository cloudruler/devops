terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.49"
    }

    azuredevops = {
      source  = "microsoft/azuredevops"
      version = ">=0.1.0"
    }

    github = {
      source = "integrations/github"
      version = "4.20.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "rg-identity"
    storage_account_name = "cloudruler"
    container_name       = "tfstates"
    key                  = "devops.tfstate"
  }
  required_version = ">= 0.14.7"
}

provider "github" {
  owner = var.github_organization
}

provider "azurerm" {
  features {}
}
