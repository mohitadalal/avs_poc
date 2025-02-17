#RESOURCE GROUP FOR AKS
module "resource_group" {
  source                   = "../../../resource_group/v1.3.0"
  resource_group_variables = var.resource_group_variables
}

#USER ASSIGNED IDENTITY
module "user_assigned_identity" {
  source                           = "../../../user_assigned_identity/v1.3.0"
  user_assigned_identity_variables = var.user_assigned_identity_variables
  depends_on                       = [module.resource_group]
}

#VIRTUAL NETWORK
module "virtual_network" {
  source                    = "../../../virtual_network/v1.3.0"
  virtual_network_variables = var.virtual_network_variables
  depends_on                = [module.resource_group]
}

#SUBNET
module "subnet" {
  source           = "../../../subnet/v1.3.0"
  subnet_variables = var.subnet_variables
  depends_on       = [module.virtual_network]
}

#ROLE ASSIGNMENT
module "role_assignment" {
  source                    = "../../../role_assignment/v1.3.0"
  role_assignment_variables = var.role_assignment_variables
  depends_on                = [module.subnet]
}

#KEY VAULT
module "key_vault" {
  source              = "../../../key_vault/v1.3.0"
  key_vault_variables = var.key_vault_variables
  depends_on          = [module.role_assignment]
}

#KEY VAULT ACCESS POLICY
module "key_vault_access_policy" {
  source                            = "../../../key_vault_access_policy/v1.3.0"
  key_vault_access_policy_variables = var.key_vault_access_policy_variables
  depends_on                        = [module.key_vault]
}

#KEY VAULT KEY
module "key_vault_key" {
  source                  = "../../../key_vault_key/v1.3.0"
  key_vault_key_variables = var.key_vault_key_variables
  depends_on              = [module.key_vault_access_policy]
}

#KEY VAULT SECRET
module "key_vault_secret" {
  source                     = "../../../key_vault_secret/v1.3.0"
  key_vault_secret_variables = var.key_vault_secret_variables
  depends_on                 = [module.key_vault_key]
}

#KUBERNETES CLUSTER
module "kubernetes_cluster" {
  source = "../../../kubernetes_cluster/v1.3.0"
  providers = {
    azurerm.keyvault_sub               = azurerm
    azurerm.log_analytics_oms_sub      = azurerm
    azurerm.log_analytics_defender_sub = azurerm
    azurerm.kubernetes_cluster_sub     = azurerm
    azurerm.private_dns_zone_sub       = azurerm
  }
  kubernetes_cluster_variables = var.kubernetes_cluster_variables
  depends_on                   = [module.key_vault_secret]
}

#KUBERNETES CLUSTER NODE POOL
module "kubernetes_cluster_node_pool" {
  source                                 = "../"
  kubernetes_cluster_node_pool_variables = var.kubernetes_cluster_node_pool_variables
  depends_on                             = [module.kubernetes_cluster]
}