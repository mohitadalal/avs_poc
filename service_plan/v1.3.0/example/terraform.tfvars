#RESOURCE GROUP 
resource_group_variables = {
  "resource_group_1" = {
    resource_group_name       = "ploceusrg000001" #(Required) Name of the Resouce Group with which it should be created.
    resource_group_location   = "eastus2"         #(Required) The Azure Region where the Resource Group should exist.
    resource_group_managed_by = "ploceus"         #(optional)  The ID of the resource or application that manages this Resource Group.
    #(Optional) A mapping of tags which should be assigned to the Resource Group.
    resource_group_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}

#SERVICE PLAN
service_plan_variables = {
  "service_plan_1" = {
    service_plan_name                         = "ploceussplan000001" #(Required) The name which should be used for this Service Plan. Changing this forces a new AppService to be created.
    service_plan_location                     = "eastus2"            #(Required) The Azure Region where the Service Plan should exist. Changing this forces a new AppService to be created.
    service_plan_os_type                      = "Linux"              #(Required) The O/S type for the App Services to be hosted in this plan. Possible values include Windows, Linux, and WindowsContainer.
    service_plan_resource_group_name          = "ploceusrg000001"    #(Required) The name of the Resource Group where the AppService should exist. Changing this forces a new AppService to be created.
    service_plan_sku_name                     = "B1"                 #(Required) The SKU for the plan. Possible values include B1, B2, B3, D1, F1, I1, I2, I3, I1v2, I2v2, I3v2, P1v2, P2v2, P3v2, P1v3, P2v3, P3v3, S1, S2, S3, SHARED, EP1, EP2, EP3, WS1, WS2, WS3, and Y1.
    service_plan_maximum_elastic_worker_count = null                 #(Optional) The maximum number of workers to use in an Elastic SKU Plan. Cannot be set unless using an Elastic SKU.
    service_plan_worker_count                 = null                 #(Optional) The number of Workers (instances) to be allocated.
    service_plan_per_site_scaling_enabled     = false                #(Optional) Should Per Site Scaling be enabled. Defaults to false.
    service_plan_zone_balancing_enabled       = false                #(Optional) Should the Service Plan balance across Availability Zones in the region. Defaults to false.
    service_plan_tags = {                                            #(Optional) A mapping of tags which should be assigned to the AppService.
      Created_By = "Ploceus",
      Department = "CIS"
    }
    service_plan_app_service_environment_name                   = null #(Optional) To fetch The ID of the App Service Environment to create this Service Plan in. If this value present service_plan_app_service_environment_v3_name & service_plan_app_service_environment_v3_resource_group_name must be null.
    service_plan_app_service_environment_resource_group_name    = null #(Optional) To fetch The ID of the App Service Environment to create this Service Plan in. If this value present service_plan_app_service_environment_v3_name & service_plan_app_service_environment_v3_resource_group_name must be null.
    service_plan_app_service_environment_v3_name                = null #(Optional) To fetch The ID of the App Service Environment V3 to create this Service Plan in. If this value present service_plan_app_service_environment_name & service_plan_app_service_environment_resource_group_name must be null.
    service_plan_app_service_environment_v3_resource_group_name = null #(Optional) To fetch The ID of the App Service Environment V3 to create this Service Plan in. If this value present service_plan_app_service_environment_name & service_plan_app_service_environment_resource_group_name must be null.
  }
}