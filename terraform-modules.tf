resource "github_repository" "terraform_github_aks_node" {
  name        = "terraform-github-aks_node"
  description = "Module for creating an AKS node"
  auto_init   = true

  template {
    owner      = split("/", github_repository.terraform_module_repo_template.full_name)[0]
    repository = github_repository.terraform_module_repo_template.name
  }
}


/*
resource "github_repository" "terraform_github_aks_node" {
  name        = "terraform-github-aks_node"
  description = "Module for creating an AKS node"
  auto_init   = true
}

resource "github_branch_default" "terraform_github_aks_node_db"{
  repository = github_repository.terraform_github_aks_node.name
  branch     = "main"
}





resource "github_branch" "terraform_github_aks_node_db" {
  repository = github_repository.terraform_github_aks_node.name
  branch     = "main"
}

resource "github_repository_file" "terraform_github_aks_node_readme" {
  repository          = github_repository.terraform_github_aks_node.name
  branch              = github_branch.terraform_github_aks_node_db.branch
  file                = "README.md"
  content             = <<-EOT
  This module is for standing up an AKS node
  This is a test
  EOT
  commit_message      = "Initializing repository"
}
*/
/*
resource "github_organization_project" "aks_node" {
  name = "A Organization Project"
  body = "This is a organization project."
}





*/