#RESOURCE GROUP
module "resource_group" {
  source                   = "../../../resource_group/v1.3.0"
  resource_group_variables = var.resource_group_variables
}

#NETWORK SECURITY GROUP
module "network_security_group" {
  source                           = "../../../network_security_group/v1.3.0"
  network_security_group_variables = var.network_security_group_variables
  depends_on                       = [module.resource_group]
}

#DDOS protection plan
# module "network_ddos_protection_plan" {
#   source                                 = "../../../network_ddos_protection_plan/v1.3.0"
#   network_ddos_protection_plan_variables = var.network_ddos_protection_plan_variables
#   depends_on = [
#     module.resource_group
#   ]
# }

#VIRTUAL NETWORK
module "virtual_network" {
  source                    = "../"
  virtual_network_variables = var.virtual_network_variables
  depends_on                = [module.network_security_group]
}