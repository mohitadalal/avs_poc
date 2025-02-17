#RESOURCE GROUP FOR AKS
module "resource_group" {
  source                   = "../../../resource_group/v1.3.0"
  resource_group_variables = var.resource_group_aks_variables
}

#ROLE ASSIGNMENT
module "role_assignment" {
  source                    = "../../../role_assignment/v1.3.0"
  role_assignment_variables = var.role_assignment_variables
  depends_on                = [module.user_assigned_identity, module.private_dns_zone, module.virtual_network]
}

#RESOURCE GROUP FOR KEY VAULT
module "resource_group_key_vault" {
  source                   = "../../../resource_group/v1.3.0"
  resource_group_variables = var.resource_group_key_vault_variables
}

#RESOURCE GROUP FOR LOG ANALYTICS
module "resource_group_log_analytics" {
  source                   = "../../../resource_group/v1.3.0"
  resource_group_variables = var.resource_group_log_analytics_workspace_oms_variables
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

#USER ASSIGNED IDENTITY
module "user_assigned_identity" {
  source                           = "../../../user_assigned_identity/v1.3.0"
  user_assigned_identity_variables = var.user_assigned_identity_variables
  depends_on                       = [module.resource_group]
}

#KEY VAULT
module "key_vault" {
  source              = "../../../key_vault/v1.3.0"
  key_vault_variables = var.key_vault_variables
  depends_on          = [module.resource_group_key_vault, module.user_assigned_identity]
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
  depends_on                 = [module.key_vault_access_policy]
}

#KEY VAULT CERTIFICATE
module "key_vault_certificate" {
  source                          = "../../../key_vault_certificate/v1.3.0"
  key_vault_certificate_variables = var.key_vault_certificate_variables
  depends_on                      = [module.key_vault_access_policy]
}

#LOG ANALYTICS WORKSPACE
module "log_analytics_workspace" {
  source                            = "../../../log_analytics_workspace/v1.3.0"
  log_analytics_workspace_variables = var.log_analytics_workspace_variables
  depends_on                        = [module.user_assigned_identity, module.resource_group_log_analytics, module.key_vault]
}

#PRIVATE DNS ZONE
module "private_dns_zone" {
  source                     = "../../../private_dns_zone/v1.3.0"
  private_dns_zone_variables = var.private_dns_zone_variables
  depends_on                 = [module.resource_group]
}

#AKS CLUSTER
module "kubernetes_cluster" {
  source                       = "../"
  kubernetes_cluster_variables = var.kubernetes_cluster_variables
  depends_on                   = [module.key_vault_secret, module.key_vault_key, module.private_dns_zone, module.log_analytics_workspace, module.subnet, module.key_vault_certificate]
}
