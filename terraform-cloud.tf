resource "tfe_organization" "cloudruler" {
  name  = "cloudruler"
  email = "brianmoore@cloudruler.com"
  collaborator_auth_policy = "two_factor_mandatory"
}

data "azurerm_key_vault_secret" "brianmoore180_gmail_github_pat" {
  name         = "brianmoore180-gmail-github-pat"
  key_vault_id = data.azurerm_key_vault.cloudruler.id
}

resource "tfe_oauth_client" "github_cloudruler" {
  name             = "GitHub (cloudruler)"
  organization     = "cloudruler"
  api_url          = "https://api.github.com"
  http_url         = "https://github.com"
  oauth_token      = data.azurerm_key_vault_secret.brianmoore180_gmail_github_pat.value
  service_provider = "github"
}

