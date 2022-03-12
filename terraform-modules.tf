resource "github_repository" "terraform_github_aks_node" {
  name        = "terraform-github-aks_node"
  description = "Module for creating an AKS node"
  auto_init   = true

  template {
    owner      = split("/", github_repository.terraform_module_repo_template.full_name)[0]
    repository = github_repository.terraform_module_repo_template.name
  }
}

