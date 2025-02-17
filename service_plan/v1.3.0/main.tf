data "azurerm_app_service_environment" "app_service_environment_id" {
  for_each            = { for k, v in var.service_plan_variables : k => v if v.service_plan_app_service_environment_name != null }
  name                = each.value.service_plan_app_service_environment_name
  resource_group_name = each.value.service_plan_app_service_environment_resource_group_name
}
data "azurerm_app_service_environment_v3" "app_service_environment_v3_id" {
  for_each            = { for k, v in var.service_plan_variables : k => v if v.service_plan_app_service_environment_v3_name != null }
  name                = each.value.service_plan_app_service_environment_v3_name
  resource_group_name = each.value.service_plan_app_service_environment_v3_resource_group_name
}
resource "azurerm_service_plan" "service_plan" {
  for_each                     = var.service_plan_variables
  name                         = each.value.service_plan_name
  location                     = each.value.service_plan_location
  os_type                      = each.value.service_plan_os_type
  resource_group_name          = each.value.service_plan_resource_group_name
  sku_name                     = each.value.service_plan_sku_name
  app_service_environment_id   = each.value.service_plan_app_service_environment_name != null ? data.azurerm_app_service_environment.app_service_environment_id[each.key].id : each.value.service_plan_app_service_environment_v3_name != null ? data.azurerm_app_service_environment_v3.app_service_environment_v3_id[each.key].id : null
  maximum_elastic_worker_count = each.value.service_plan_maximum_elastic_worker_count
  worker_count                 = each.value.service_plan_worker_count
  per_site_scaling_enabled     = each.value.service_plan_per_site_scaling_enabled
  zone_balancing_enabled       = each.value.service_plan_zone_balancing_enabled
  tags                         = merge(each.value.service_plan_tags, tomap({ Created_Time = formatdate("DD-MM-YYYY hh:mm:ss ZZZ", timestamp()) }))
  lifecycle { ignore_changes = [tags["Created_Time"]] }
}