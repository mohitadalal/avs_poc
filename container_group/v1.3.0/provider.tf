terraform {
  required_providers {
    azurerm = {
      source                = "hashicorp/azurerm"
      version               = "=3.75.0"
      configuration_aliases = [azurerm.log_analytics_workspace_sub, azurerm.key_vault_sub, azurerm.container_group_sub, azurerm.storage_account_sub, azurerm.user_assigned_identity_sub]
    }
  }
}
