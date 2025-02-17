## Attributes:
- service_plan_name                         = string      #(Required) The name which should be used for this Service Plan. Changing this forces a new AppService to be created.
- service_plan_location                     = string      #(Required) The Azure Region where the Service Plan should exist. Changing this forces a new AppService to be created.
- service_plan_os_type                      = string      #(Required) The O/S type for the App Services to be hosted in this plan. Possible values include Windows, Linux, and WindowsContainer.
- service_plan_resource_group_name          = string      #(Required) The name of the Resource Group where the AppService should exist. Changing this forces a new AppService to be created.
- service_plan_sku_name                     = string      #(Required) The SKU for the plan. Possible values include B1, B2, B3, D1, F1, I1, I2, I3, I1v2, I2v2, I3v2, P1v2, P2v2, P3v2, P1v3, P2v3, P3v3, S1, S2, S3, SHARED, EP1, EP2, EP3, WS1, WS2, WS3, and Y1.
- service_plan_maximum_elastic_worker_count = number      #(Optional) The maximum number of workers to use in an Elastic SKU Plan. Cannot be set unless using an Elastic SKU.
- service_plan_worker_count                 = number      #(Optional) The number of Workers (instances) to be allocated.
- service_plan_per_site_scaling_enabled     = bool        #(Optional) Should Per Site Scaling be enabled. Defaults to false.
- service_plan_zone_balancing_enabled       = bool        #(Optional) Should the Service Plan balance across Availability Zones in the region. Defaults to false.
- service_plan_tags                         = map(string) #(Optional) A mapping of tags which should be assigned to the AppService.                                            = map(string) #(Optional) A mapping of tags to assign to the resource.
- service_plan_app_service_environment_name                   = string      #(Optional) To fetch The ID of the App Service Environment to create this Service Plan in. If this value present service_plan_app_service_environment_v3_name & service_plan_app_service_environment_v3_resource_group_name must be null.
- service_plan_app_service_environment_resource_group_name    = string      #(Optional) To fetch The ID of the App Service Environment to create this Service Plan in. If this value present service_plan_app_service_environment_v3_name & service_plan_app_service_environment_v3_resource_group_name must be null.
- service_plan_app_service_environment_v3_name                = string      #(Optional) To fetch The ID of the App Service Environment V3 to create this Service Plan in. If this value present service_plan_app_service_environment_name & service_plan_app_service_environment_resource_group_name must be null.
- service_plan_app_service_environment_v3_resource_group_name = string      #(Optional) To fetch The ID of the App Service Environment V3 to create this Service Plan in. If this value present service_plan_app_service_environment_name & service_plan_app_service_environment_resource_group_name must be null.

>## Notes:
>1. Requires an Isolated SKU. Use one of I1, I2, I3 for azurerm_app_service_environment, or I1v2, I2v2, I3v2 for azurerm_app_service_environment_v3
>2. Elastic and Consumption SKUs (Y1, EP1, EP2, and EP3) are for use with Function Apps.
>3. Isolated SKUs (I1, I2, I3, I1v2, I2v2, and I3v2) can only be used with App Service Environments
>4. If zone_balancing_enabled setting is set to true and the worker_count value is specified, it should be set to a multiple of the number of availability zones in the region. Please see the Azure documentation for the number of Availability Zones in your region.