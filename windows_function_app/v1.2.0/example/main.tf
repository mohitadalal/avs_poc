#RESOURCE GROUP
module "resource_group" {
  providers = {
    azurerm = azurerm.function_app_sub
  }
  source                   = "../../../resource_group/v1.2.0"
  resource_group_variables = var.resource_group_variables
}

#LOG ANALYTICS WORKSPACE
module "log_analytics_workspace" {
  providers = {
    azurerm.keyvault_sub      = azurerm.function_app_sub
    azurerm.log_analytics_sub = azurerm.log_analytics_sub
  }
  source                            = "../../../log_analytics_workspace/v1.2.0"
  log_analytics_workspace_variables = var.log_analytics_workspace_variables
  depends_on                        = [module.resource_group, module.key_vault]
}
#APPLICATION INSIGHTS 
module "application_insights" {
  providers = {
    azurerm.keyvault_sub             = azurerm.function_app_sub
    azurerm.application_insights_sub = azurerm.application_insights_sub
    azurerm.log_analytics_sub        = azurerm.function_app_sub
  }
  source                         = "../../../application_insights/v1.2.0"
  application_insights_variables = var.application_insights_variables
  depends_on                     = [module.resource_group, module.log_analytics_workspace, module.key_vault]
}

#APP SERVICE PLAN
module "app_service_plan" {
  providers = {
    azurerm = azurerm.function_app_sub
  }
  source                     = "../../../app_service_plan/v1.2.0"
  app_service_plan_variables = var.app_service_plan_variables
  depends_on                 = [module.resource_group]
}

#KEY VAULT
module "key_vault" {
  providers = {
    azurerm = azurerm.key_vault_sub
  }
  source              = "../../../key_vault/v1.2.0"
  key_vault_variables = var.key_vault_variables
  depends_on          = [module.resource_group]
}

#KEY VAULT KEY
module "key_vault_key" {
  providers = {
    azurerm = azurerm.key_vault_sub
  }
  source                  = "../../../key_vault_key/v1.2.0"
  key_vault_key_variables = var.key_vault_key_variables
  depends_on = [
    module.key_vault, module.resource_group
  ]
}

#KEY VAULT SECRET
module "key_vault_secret" {
  providers = {
    azurerm = azurerm.key_vault_sub
  }
  source                     = "../../../key_vault_secret/v1.2.0"
  key_vault_secret_variables = var.key_vault_secret_variables
  depends_on                 = [module.resource_group, module.key_vault]
}

#KEY VAULT ACCESS POLICY
module "key_vault_access_policy" {
  providers = {
    azurerm = azurerm.key_vault_sub
  }
  source                            = "../../../key_vault_access_policy/v1.2.0"
  key_vault_access_policy_variables = var.key_vault_access_policy_variables
  depends_on                        = [module.key_vault, module.user_assigned_identity, module.resource_group]
}

#USER ASSIGNED IDENTITY
module "user_assigned_identity" {
  providers = {
    azurerm = azurerm.user_assigned_identity_sub
  }
  source                           = "../../../user_assigned_identity/v1.2.0"
  user_assigned_identity_variables = var.user_assigned_identity_variables
  depends_on                       = [module.resource_group]
}

#Network Security Group
module "network_security_group" {
  providers = {
    azurerm = azurerm.virtual_network_sub
  }
  source                           = "../../../network_security_group/v1.2.0"
  network_security_group_variables = var.network_security_group_variables
  depends_on                       = [module.resource_group]
}

#VNET
module "virtual_network" {
  providers = {
    azurerm = azurerm.virtual_network_sub
  }
  source                    = "../../../virtual_network/v1.2.0"
  virtual_network_variables = var.virtual_network_variables
  depends_on                = [module.resource_group, module.network_security_group]
}

# SUBNET
module "subnet" {
  providers = {
    azurerm = azurerm.virtual_network_sub
  }
  source           = "../../../subnet/v1.2.0"
  subnet_variables = var.subnet_variables
  depends_on       = [module.resource_group, module.network_security_group, module.virtual_network]
}

# API MANAGEMENT
module "api_management" {
  source = "../../../api_management/v1.2.0"
  providers = {
    azurerm.api_management_sub = azurerm.api_management_sub
    azurerm.key_vault_sub      = azurerm.function_app_sub
  }
  api_management_variables = var.api_management_variables
  depends_on = [
    module.resource_group
  ]
}

#API MANAGEMENT API
module "api_management_api" {
  providers = {
    azurerm = azurerm.api_management_sub
  }
  source                       = "../../../api_management_api/v1.2.0/"
  api_management_api_variables = var.api_management_api_variables
  depends_on = [
    module.resource_group, module.api_management
  ]
}
#STORAGE ACCOUNT
module "storage_account" {
  providers = {
    azurerm.storage_account_sub = azurerm.storage_account_sub
    azurerm.key_vault_sub       = azurerm.function_app_sub
  }
  source                    = "../../../storage_account/v1.2.0"
  storage_account_variables = var.storage_account_variables
  depends_on = [
    module.resource_group, module.virtual_network, module.subnet, module.user_assigned_identity, module.key_vault, module.key_vault_key
  ]
}


#STORAGE CONTAINER
module "storage_container" {
  providers = {
    azurerm = azurerm.storage_account_sub
  }
  source                      = "../../../storage_container/v1.2.0"
  storage_container_variables = var.storage_container_variables
  depends_on                  = [module.storage_account]
}

#windows FUCTION APP
module "windows_function_app" {
  providers = {
    azurerm.function_app_sub           = azurerm.function_app_sub
    azurerm.api_management_sub         = azurerm.api_management_sub
    azurerm.application_insights_sub   = azurerm.application_insights_sub
    azurerm.storage_account_sub        = azurerm.storage_account_sub
    azurerm.key_vault_sub              = azurerm.key_vault_sub
    azurerm.virtual_network_sub        = azurerm.virtual_network_sub
    azurerm.user_assigned_identity_sub = azurerm.user_assigned_identity_sub
  }
  source                         = "../"
  windows_function_app_variables = var.windows_function_app_variables
  depends_on = [module.resource_group, module.log_analytics_workspace, module.application_insights, module.key_vault, module.user_assigned_identity,
  module.virtual_network, module.storage_account, module.storage_container]
}