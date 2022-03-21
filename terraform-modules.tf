resource "github_repository" "terraform_azurerm_aks_cluster" {
  name        = "terraform-azurerm-aks_cluster"
  description = "Module for creating an AKS cluster"
  auto_init   = true

  template {
    owner      = split("/", github_repository.terraform_module_repo_template.full_name)[0]
    repository = github_repository.terraform_module_repo_template.name
  }
}

resource "tfe_registry_module" "module-terraform_azurerm_aks_cluster" {
  vcs_repo {
    display_identifier = "${var.github_organization}/${github_repository.terraform_azurerm_aks_cluster.name}"
    identifier         = "${var.github_organization}/${github_repository.terraform_azurerm_aks_cluster.name}"
    oauth_token_id     = tfe_oauth_client.github_cloudruler.oauth_token_id
  }
}