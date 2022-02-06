output "devops_azurecr_service_principal_id" {
  value = azuredevops_serviceendpoint_dockerregistry.cloudruler.docker_username
}

# output "appcs_endpoint" {
#   value = azurerm_app_configuration.appcs.endpoint
# }