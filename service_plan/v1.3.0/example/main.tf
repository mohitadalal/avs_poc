#RESOURCE GROUP
module "resource_group" {
  source                   = "../../../resource_group/v1.3.0"
  resource_group_variables = var.resource_group_variables
}

#SERVICE PLAN
module "service_plan" {
  source                 = "../"
  service_plan_variables = var.service_plan_variables
  depends_on             = [module.resource_group]
}