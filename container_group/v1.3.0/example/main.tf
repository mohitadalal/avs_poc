#RESOURCE GROUP FOR CONTAINER GROUP
module "container_group_resource_group" {
  source                   = "../../../resource_group/v1.3.0"
  resource_group_variables = var.container_group_resource_group_variables
}

#RESOURCE GROUP FOR LOG ANALYTICS WORKSPACE
module "log_analytics_workspace_resource_group" {
  source                   = "../../../resource_group/v1.3.0"
  resource_group_variables = var.log_analytics_workspace_resource_group_variables
}

#RESOURCE GROUP FOR KEY VAULT
module "key_vault_resource_group" {
  source                   = "../../../resource_group/v1.3.0"
  resource_group_variables = var.key_vault_resource_group_variables
}

#LOG ANALYTICS WORKSPACE
module "log_analytics_workspace" {
  source                            = "../../../log_analytics_workspace/v1.3.0"
  log_analytics_workspace_variables = var.log_analytics_workspace_variables
  depends_on = [
    module.log_analytics_workspace_resource_group, module.key_vault_access_policy
  ]
}

#SUBNET
module "subnet" {
  source           = "../../../subnet/v1.3.0"
  subnet_variables = var.subnet_variables
  depends_on       = [module.virtual_network]
}

#VIRTUAL NETWORK
module "virtual_network" {
  source                    = "../../../virtual_network/v1.3.0"
  virtual_network_variables = var.virtual_network_variables
  depends_on                = [module.container_group_resource_group]
}

#USER ASSIGNED IDENTITY
module "user_assigned_identity" {
  source                           = "../../../user_assigned_identity/v1.3.0"
  user_assigned_identity_variables = var.user_assigned_identity_variables
  depends_on = [
    module.container_group_resource_group
  ]
}

#KEY VAULT
module "key_vault" {
  source              = "../../../key_vault/v1.3.0"
  key_vault_variables = var.key_vault_variables
  depends_on          = [module.key_vault_resource_group]
}

#KEY VAULT ACCESS POLICY
module "key_vault_access_policy" {
  source                            = "../../../key_vault_access_policy/v1.3.0"
  key_vault_access_policy_variables = var.key_vault_access_policy_variables
  depends_on                        = [module.key_vault, module.user_assigned_identity]
}

#KEY VAULT KEY
module "key_vault_key" {
  source                  = "../../../key_vault_key/v1.3.0"
  key_vault_key_variables = var.key_vault_key_variables
  depends_on              = [module.key_vault_access_policy]
}

#STORAGE ACCOUNT
module "storage_account" {
  source                    = "../../../storage_account/v1.3.0"
  storage_account_variables = var.storage_account_variables
  depends_on                = [module.key_vault_key, module.user_assigned_identity]
}

#CONTAINER GROUP
module "container_group" {
  source                    = "../"
  container_group_variables = var.container_group_variables
  depends_on                = [module.subnet, module.log_analytics_workspace, module.user_assigned_identity, module.storage_account]
}
