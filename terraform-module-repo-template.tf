resource "github_repository" "terraform_module_repo_template" {
  name        = "terraform-module-repo-template"
  description = "Template repository for Terraform Module repositories"
  auto_init   = true
  is_template = true
}

resource "github_repository_file" "terraform_module_repo_template_main" {
  repository          = github_repository.terraform_module_repo_template.name
  branch              = github_repository.terraform_module_repo_template.default_branch
  file                = "main.tf"
  content             = <<-EOT
  locals {
  }
  EOT
  commit_message      = "Initializing repository"
}

resource "github_repository_file" "terraform_module_repo_template_variables" {
  repository          = github_repository.terraform_module_repo_template.name
  branch              = github_repository.terraform_module_repo_template.default_branch
  file                = "variables.tf"
  content             = <<-EOT
  #variable "name" {
  #  description = ""
  #  type = string
  #}
  EOT
  commit_message      = "Initializing repository"
}

resource "github_repository_file" "terraform_module_repo_template_outputs" {
  repository          = github_repository.terraform_module_repo_template.name
  branch              = github_repository.terraform_module_repo_template.default_branch
  file                = "outputs.tf"
  content             = <<-EOT
  #output "name" {
  #  value = "value"
  #}
  EOT
  commit_message      = "Initializing repository"
}