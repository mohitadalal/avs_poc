terraform {
  required_providers {
    azurerm = {
      source                = "hashicorp/azurerm"
      version               = "=3.33.0"
      configuration_aliases = [azurerm.key_vault_sub, azurerm.api_management_sub, azurerm.user_assigned_identity_sub, azurerm.function_app_sub, azurerm.application_insights_sub, azurerm.storage_account_sub, azurerm.virtual_network_sub]
    }
  }
}
