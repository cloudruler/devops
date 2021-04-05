# Introduction 
TODO: Give a short introduction of your project. Let this section explain the objectives or the motivation behind this project. 

#Migrating state
terraform import azuredevops_project.infrastructure "infrastructure"
terraform import azuredevops_project.devops "devops"
terraform import azuredevops_project.dev "dev"

terraform import azuredevops_git_repository.devcontainers devops/805ad24c-aab3-43f4-a40a-0ed7b7f7484b
terraform import azuredevops_git_repository.pipelines devops/ab6f6495-23d9-4c12-aca7-3f666ef50a55


terraform import azuredevops_serviceendpoint_azurecr.serviceendpoint 00000000-0000-0000-0000-000000000000/00000000-0000-0000-0000-000000000000

terraform import azuredevops_git_repository.initialization infrastructure/11defb74-6617-4f9f-b83e-1e89fae45e4f
terraform import azuredevops_git_repository.management infrastructure/e84a3041-7532-46d9-8b92-679a950570c7
terraform import azuredevops_git_repository.infrastructure infrastructure/3664102a-4171-4601-9467-911870eb86ee
terraform import azuredevops_git_repository.scripts infrastructure/0ea90bd0-17fc-4b4a-94ca-9193f7fde022
terraform import azuredevops_git_repository.sandbox infrastructure/4d82dfa1-5a4c-4d18-b3df-c16703ee1fb5
terraform import azuredevops_git_repository.terraform-cloudruler-common infrastructure/a0c03a1d-5c12-4e1b-bcfd-d346f13cc3d3
terraform import azuredevops_git_repository.identity infrastructure/8e7895e9-3c38-457a-afe5-db0f85cf5e94
terraform import azuredevops_git_repository.devops infrastructure/1ccfe3ac-7e1d-44a4-9206-e2ededb65e9b
terraform import azuredevops_git_repository.connectivity infrastructure/d16f7c13-8f5c-43d9-bd35-e44c990e3104
terraform import azuredevops_git_repository.aks_engine infrastructure/b579a0c5-5595-4b00-96b8-e583dcb38f4d


terraform import azuredevops_git_repository.dev dev/08f48237-74d5-431f-b72e-49e50322240f
terraform import azuredevops_git_repository.python dev/f635e791-8015-419b-9771-65d0dad28dbe