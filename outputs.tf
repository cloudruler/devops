output "devops_azurecr_service_principal_id" {
  value = azuredevops_serviceendpoint_azurecr.cloudruler.service_principal_id
}

# output "appcs_endpoint" {
#   value = azurerm_app_configuration.appcs.endpoint
# }