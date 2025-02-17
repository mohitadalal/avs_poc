#RESOURCE GROUP VARIABLES
variable "resource_group_variables" {
  type = map(object({
    resource_group_name       = string      #(Required) Name of the Resouce Group with which it should be created.
    resource_group_location   = string      #(Required) The Azure Region where the Resource Group should exist.
    resource_group_managed_by = string      #(optional)  The ID of the resource or application that manages this Resource Group.
    resource_group_tags       = map(string) #(Optional) A mapping of tags which should be assigned to the Resource Group.
  }))
  description = "Map of Resource groups"
  default     = {}
}

#SERVICE PLAN VARIABLES
variable "service_plan_variables" {
  description = "Map of object of service plan variables"
  type = map(object({
    service_plan_name                                           = string      #(Required) The name which should be used for this Service Plan. Changing this forces a new AppService to be created.
    service_plan_location                                       = string      #(Required) The Azure Region where the Service Plan should exist. Changing this forces a new AppService to be created.
    service_plan_os_type                                        = string      #(Required) The O/S type for the App Services to be hosted in this plan. Possible values include Windows, Linux, and WindowsContainer.
    service_plan_resource_group_name                            = string      #(Required) The name of the Resource Group where the AppService should exist. Changing this forces a new AppService to be created.
    service_plan_sku_name                                       = string      #(Required) The SKU for the plan. Possible values include B1, B2, B3, D1, F1, I1, I2, I3, I1v2, I2v2, I3v2, P1v2, P2v2, P3v2, P1v3, P2v3, P3v3, S1, S2, S3, SHARED, EP1, EP2, EP3, WS1, WS2, WS3, and Y1.
    service_plan_maximum_elastic_worker_count                   = number      #(Optional) The maximum number of workers to use in an Elastic SKU Plan. Cannot be set unless using an Elastic SKU.
    service_plan_worker_count                                   = number      #(Optional) The number of Workers (instances) to be allocated.
    service_plan_per_site_scaling_enabled                       = bool        #(Optional) Should Per Site Scaling be enabled. Defaults to false.
    service_plan_zone_balancing_enabled                         = bool        #(Optional) Should the Service Plan balance across Availability Zones in the region. Defaults to false.
    service_plan_tags                                           = map(string) #(Optional) A mapping of tags which should be assigned to the AppService.
    service_plan_app_service_environment_name                   = string      #(Optional) To fetch The ID of the App Service Environment to create this Service Plan in. If this value present service_plan_app_service_environment_v3_name & service_plan_app_service_environment_v3_resource_group_name must be null.
    service_plan_app_service_environment_resource_group_name    = string      #(Optional) To fetch The ID of the App Service Environment to create this Service Plan in. If this value present service_plan_app_service_environment_v3_name & service_plan_app_service_environment_v3_resource_group_name must be null.
    service_plan_app_service_environment_v3_name                = string      #(Optional) To fetch The ID of the App Service Environment V3 to create this Service Plan in. If this value present service_plan_app_service_environment_name & service_plan_app_service_environment_resource_group_name must be null.
    service_plan_app_service_environment_v3_resource_group_name = string      #(Optional) To fetch The ID of the App Service Environment V3 to create this Service Plan in. If this value present service_plan_app_service_environment_name & service_plan_app_service_environment_resource_group_name must be null.
  }))
  default = {}
}