#RESOURCE GROUP 
resource_group_variables = {
  "resource_group_1" = {
    resource_group_name     = "ploceusrg000001" #(Required) Name of the Resouce Group with which it should be created.
    resource_group_location = "eastus"          #(Required) The Azure Region where the Resource Group should exist.
    #(Optional) A mapping of tags which should be assigned to the Resource Group.
    resource_group_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}

#LOG ANALYTICS WORKSPACE INPUTS
log_analytics_workspace_variables = {
  "log_analytics_workspace_1" = {
    log_analytics_workspace_name                                   = "ploceuslaw000001"      #(Required) Specifies the name of the Log Analytics Workspace. Workspace name should include 4-63 letters, digits or '-'. The '-' shouldn't be the first or the last symbol. Changing this forces a new resource to be created.
    log_analytics_workspace_resource_group_name                    = "ploceusrg000001"       #(Required) The name of the resource group in which the Log Analytics workspace is created. Changing this forces a new resource to be created.
    log_analytics_workspace_location                               = "eastus"                #(Required) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created
    log_analytics_workspace_sku                                    = "PerGB2018"             #(Optional) Specifies the SKU of the Log Analytics Workspace. Possible values are Free, PerNode, Premium, Standard, Standalone, Unlimited, CapacityReservation, and PerGB2018 (new SKU as of 2018-04-03). Defaults to PerGB2018
    log_analytics_workspace_retention_in_days                      = "30"                    #(Optional) The workspace data retention in days. Possible values are either 7 (Free Tier only) or range between 30 and 730.
    log_analytics_workspace_daily_quota_gb                         = "-1"                    #(Optional) The workspace daily quota for ingestion in GB. Defaults to -1 (unlimited) if omitted.
    log_analytics_workspace_cmk_for_query_forced                   = false                   #(Optional) Is Customer Managed Storage mandatory for query management?
    log_analytics_workspace_internet_ingestion_enabled             = true                    #(Optional) Should the Log Analytics Workspace support ingestion over the Public Internet? Defaults to true
    log_analytics_workspace_internet_query_enabled                 = true                    #(Optional) Should the Log Analytics Workspace support querying over the Public Internet? Defaults to true
    log_analytics_workspace_reservation_capacity_in_gb_per_day     = null                    #(Optional) The capacity reservation level in GB for this workspace. Must be in increments of 100 between 100 and 5000
    log_analytics_workspace_key_vault_name                         = "ploceuskeyvault000001" #(Required) specify the keyvault name to store the log analytics workspace keys.
    log_analytics_workspace_key_vault_resource_group_name          = "ploceusrg000001"       #(Required) The name of the resource group in which the keyvault is present.
    log_analytics_workspace_primary_shared_key_vault_secret_name   = "ploceuskvsn000001"     #(Required) The name of the keyvault secret where the primary shared key of log analytics workspace is stored
    log_analytics_workspace_secondary_shared_key_vault_secret_name = "ploceuskvsn000002"     #(Required) The name of the keyvault secret where the secondary shared key of log analytics workspace is stored 
    log_analytics_workspace_tags = {                                                         #(Optional) A mapping of tags to assign to the resource.
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}

#APPLICATION INSIGHTS INPUTS
application_insights_variables = {
  application_insights_1 = {
    application_insights_name                                        = "ploceusai000001"       #(Required) Specifies the name of the Application Insights component. Changing this forces a new resource to be created.
    application_insights_resource_group_name                         = "ploceusrg000001"       #(Required) The name of the resource group in which to create the Application Insights component.
    application_insights_location                                    = "eastus"                #(Required) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created.
    application_insights_application_type                            = "web"                   #(Required) Specifies the type of Application Insights to create. Valid values are ios for iOS, java for Java web, MobileCenter for App Center, Node.JS for Node.js, other for General, phone for Windows Phone, store for Windows Store and web for ASP.NET. Please note these values are case sensitive; unmatched values are treated as ASP.NET by Azure. Changing this forces a new resource to be created
    application_insights_daily_data_cap_in_gb                        = 10                      #(Optional) Specifies the Application Insights component daily data volume cap in GB.  
    application_insights_daily_data_cap_notifications_disabled       = false                   #(Optional) Specifies if a notification email will be send when the daily data volume cap is met
    application_insights_retention_in_days                           = 90                      #(Optional) Specifies the retention period in days. Possible values are 30, 60, 90, 120, 180, 270, 365, 550 or 730. Defaults to 90
    application_insights_sampling_percentage                         = 50                      #(Optional) Specifies the percentage of the data produced by the monitored application that is sampled for Application Insights telemetry
    application_insights_disable_ip_masking                          = false                   #(Optional) By default the real client IP is masked as 0.0.0.0 in the logs. Use this argument to disable masking and log the real client IP. Defaults to false
    application_insights_log_analytics_workspace_name                = "ploceuslaw000001"      #(Optional) The name of the log analytics workspace
    application_insights_log_analytics_workspace_resource_group_name = "ploceusrg000001"       #(Optional) The resource group name of the log analytics workspace
    application_insights_local_authentication_disabled               = false                   #(Optional) Disable Non-Azure AD based Auth. Defaults to false
    application_insights_internet_ingestion_enabled                  = false                   #(Optional) Should the Application Insights component support ingestion over the Public Internet? Defaults to true
    application_insights_internet_query_enabled                      = false                   #(Optional) Should the Application Insights component support querying over the Public Internet? Defaults to true
    application_insights_force_customer_storage_for_profiler         = false                   #(Optional) Should the Application Insights component force users to create their own storage account for profiling? Defaults to false.
    application_insights_key_vault_name                              = "ploceuskeyvault000001" #(Required) specify the keyvault name to store the log analytics workspace keys.
    application_insights_key_vault_resource_group_name               = "ploceusrg000001"       #(Required) The name of the resource group in which the keyvault is present.
    application_insights_instrumentation_key_vault_secret_name       = "ploceuskvsn000003"     #(Required) The name of the keyvault secret where the instrumentation key of application insights is stored
    application_insights_connection_string_key_vault_secret_name     = "ploceuskvsn000004"     #(Required) The name of the keyvault secret where the connection string of application insights is stored  
    application_insights_tags = {                                                              #(Optional) A mapping of tags to assign to the resource
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}

#APP SERVICE PLAN
app_service_plan_variables = {
  "app_service_plan_1" = {
    app_service_plan_name                          = "ploceusappplan000001" #(Required) The name which should be used for this Service Plan. Changing this forces a new AppService to be created.
    app_service_plan_location                      = "eastus"               #(Required) The Azure Region where the Service Plan should exist. Changing this forces a new AppService to be created.
    app_service_plan_os_type                       = "Windows"              #(Required) The O/S type for the App Services to be hosted in this plan. Possible values include Windows, Linux, and WindowsContainer.
    app_service_plan_resource_group_name           = "ploceusrg000001"      #(Required) The name of the Resource Group where the AppService should exist. Changing this forces a new AppService to be created.
    app_service_plan_sku_name                      = "S1"                   # (Required) The SKU for the plan. Possible values include B1, B2, B3, D1, F1, I1, I2, I3, I1v2, I2v2, I3v2, P1v2, P2v2, P3v2, P1v3, P2v3, P3v3, S1, S2, S3, SHARED, EP1, EP2, EP3, WS1, WS2, WS3, and Y1.#Isolated SKUs (I1, I2, I3, I1v2, I2v2, and I3v2) can only be used with App Service Environments #Elastic and Consumption SKUs (Y1, EP1, EP2, and EP3) are for use with Function Apps.
    app_service_plan_maximum_elastic_worker_count  = null                   #(Optional) The maximum number of workers to use in an Elastic SKU Plan. Cannot be set unless using an Elastic SKU.
    app_service_plan_worker_count                  = null                   #(Optional) The number of Workers (instances) to be allocated.
    app_service_plan_per_site_scaling_enabled      = false                  #(Optional) Should Per Site Scaling be enabled. Defaults to false.
    app_service_plan_zone_balancing_enabled        = false                  #(Optional) Should the Service Plan balance across Availability Zones in the region. Defaults to false. If this setting is set to true and the worker_count value is specified, it should be set to a multiple of the number of availability zones in the region. Please see the Azure documentation for the number of Availability Zones in your region.
    app_service_environment_name                   = null                   #(Optional) Name of the app service environemnt Requires an Isolated SKU. Use one of I1, I2, I3 for azurerm_app_service_environment, or I1v2, I2v2, I3v2 for azurerm_app_service_environment_v3
    app_service_environment_resource_group_name    = null                   #(Optional) Resource Group Name of the app service environemnt
    app_service_environment_v3_name                = null                   #(Optional) Name of the app service environemnt Requires an Isolated SKU. Use one of I1, I2, I3 for azurerm_app_service_environment, or I1v2, I2v2, I3v2 for azurerm_app_service_environment_v3
    app_service_environment_v3_resource_group_name = null                   #(Optional) Resource Group Name of the app service environemnt
    # (Optional) A mapping of tags which should be assigned to the AppService.
    app_service_plan_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}

#KEY VAULT
key_vault_variables = {
  "key_vault_1" = {
    key_vault_name                                  = "ploceuskeyvault000001"                                                                                                                                                                         #(Required) Specifies the name of the Key Vault, The name must be globally unique.
    key_vault_location                              = "eastus"                                                                                                                                                                                        #(Required) Specifies the supported Azure location where the resource exists.
    key_vault_resource_group_name                   = "ploceusrg000001"                                                                                                                                                                               #(Required) The name of the resource group in which to create the Key Vault.
    key_vault_enabled_for_disk_encryption           = true                                                                                                                                                                                            #(Optional) Boolean flag to specify whether Azure Disk Encryption is permitted to retrieve secrets from the vault and unwrap keys. Defaults to false.
    key_vault_enabled_for_deployment                = true                                                                                                                                                                                            #(Optional) Boolean flag to specify whether Azure Virtual Machines are permitted to retrieve certificates stored as secrets from the key vault. Defaults to false
    key_vault_enabled_for_template_deployment       = true                                                                                                                                                                                            # (Optional) Boolean flag to specify whether Azure Resource Manager is permitted to retrieve secrets from the key vault. Defaults to false.
    key_vault_enable_rbac_authorization             = false                                                                                                                                                                                           #(Optional) Boolean flag to specify whether Azure Key Vault uses Role Based Access Control (RBAC) for authorization of data actions. Defaults to false.
    key_vault_soft_delete_retention_days            = "7"                                                                                                                                                                                             #(Optional) The number of days that items should be retained for once soft-deleted. This value can be between 7 and 90 (the default) days.
    key_vault_purge_protection_enabled              = true                                                                                                                                                                                            #(Optional) Is Purge Protection enabled for this Key Vault? Defaults to false.
    key_vault_sku_name                              = "standard"                                                                                                                                                                                      #(Required) The Name of the SKU used for this Key Vault. Possible values are standard and premium
    key_vault_access_container_agent_name           = null                                                                                                                                                                                            #(Optional) Self hosted conatiner agent name.
    key_vault_access_policy_application_id          = null                                                                                                                                                                                            #(Optional) The object ID of an Application in Azure Active Directory.                                                                                                                                                                        
    key_vault_public_network_access_enabled         = true                                                                                                                                                                                            #(Optional) key_vault_public_network_access_enabled
    key_vault_access_policy_key_permissions         = ["Get", "List", "Create", "Delete", "Recover", "Backup", "Restore", "Purge"]                                                                                                                    #(Optional) List of key permissions, must be one or more from the following: Backup, Create, Decrypt, Delete, Encrypt, Get, Import, List, Purge, Recover, Restore, Sign, UnwrapKey, Update, Verify and WrapKey.
    key_vault_access_policy_secret_permissions      = ["Get", "List", "Delete", "Recover", "Backup", "Restore", "Purge"]                                                                                                                              #(Optional) List of secret permissions, must be one or more from the following: Backup, Delete, Get, List, Purge, Recover, Restore and Set.
    key_vault_access_policy_storage_permissions     = []                                                                                                                                                                                              #(Optional) List of storage permissions, must be one or more from the following: Backup, Delete, DeleteSAS, Get, GetSAS, List, ListSAS, Purge, Recover, RegenerateKey, Restore, Set, SetSAS and Update.
    key_vault_access_policy_certificate_permissions = ["Backup", "Create", "Delete", "DeleteIssuers", "Get", "GetIssuers", "Import", "List", "ListIssuers", "ManageContacts", "ManageIssuers", "Purge", "Recover", "Restore", "SetIssuers", "Update"] # (Optional) List of certificate permissions, must be one or more from the following: Backup, Create, Delete, DeleteIssuers, Get, GetIssuers, Import, List, ListIssuers, ManageContacts, ManageIssuers, Purge, Recover, Restore, SetIssuers and Update.
    #(Optional) A mapping of tags which should be assigned to the key vault.
    key_vault_tags = { #(Optional) A mapping of tags which should be assigned to the key vault.
      Created_By = "Ploceus",
      Department = "CIS"
    }
    key_vault_network_acls_enabled        = false           #(Optional) A network_acls block as defined below to be enabled or disabled
    key_vault_network_acls_bypass         = "AzureServices" #(Required) Specifies which traffic can bypass the network rules. Possible values are AzureServices and None.
    key_vault_network_acls_default_action = "Deny"          # (Required) The Default Action to use when no rules match from ip_rules / virtual_network_subnet_ids. Possible values are Allow and Deny.
    key_vault_network_acls_ip_rules       = null            # (Optional) One or more IP Addresses, or CIDR Blocks which should be able to access the Key Vault.

    #(Optional) One or more Subnet ID's which should be able to access this Key Vault.
    key_vault_network_acls_virtual_networks = null
    key_vault_contact_information_enabled   = false #(Optional) One or more contact block as defined below to be enabled or disabled.
    key_vault_contact_email                 = null  #(Required) E-mail address of the contact.
    key_vault_contact_name                  = null  #(Optional) Name of the contact.
    key_vault_contact_phone                 = null  #(Optional) Phone number of the contact.

  }
}

# KAY VAULT KEY 
key_vault_key_variables = {
  "key_vault_key_01" = {
    key_vault_name                = "ploceuskeyvault000001"                                          #(Required) The name of the Key Vault where the Key should be created.
    key_vault_resource_group_name = "ploceusrg000001"                                                #(Required) The resource group name of the Key Vault where the Key should be created.
    key_vault_key_name            = "ploceuskvkey000001"                                             #(Required) Specifies the name of the Key Vault Key.
    key_vault_key_key_type        = "RSA"                                                            #(Required) Specifies the Key Type to use for this Key Vault Key. Possible values are EC (Elliptic Curve), EC-HSM, RSA and RSA-HSM.
    key_vault_key_key_size        = 2048                                                             #(Optional) Specifies the Size of the RSA key to create in bytes. For example, 1024 or 2048. Note: This field is required if key_type is RSA or RSA-HSM.
    key_vault_key_curve           = null                                                             #(Optional) Specifies the curve to use when creating an EC key. Possible values are P-256, P-256K, P-384, and P-521. This field will be required in a future release if key_type is EC or EC-HSM. The API will default to P-256 if nothing is specified.
    key_vault_key_key_opts        = ["decrypt", "encrypt", "sign", "unwrapKey", "verify", "wrapKey"] #(Required) A list of JSON web key operations. Possible values include: decrypt, encrypt, sign, unwrapKey, verify and wrapKey. Please note these values are case sensitive.
    key_vault_key_not_before_date = "2023-01-05T18:15:30Z"                                           #(Optional) Key not usable before the provided UTC datetime (Y-m-d'T'H:M:S'Z').
    key_vault_key_expiration_date = "2023-05-05T18:15:30Z"                                           #(Optional) Expiration UTC datetime (Y-m-d'T'H:M:S'Z').
    key_vault_key_tags = {                                                                           #(Optional) A mapping of tags to assign to the resource.
      Created_By = "Ploceus"
      Department = "CIS"
    }
  }
}

#KEY VAULT SECRET
key_vault_secret_variables = {
  "key_vault_secret_1" = {
    key_vault_name                       = "ploceuskeyvault000001"      #(Required) Specifies the name of the Key Vault.
    key_vault_secret_value               = "authsettingactivedirectory" #(Required) Specifies the value of the Key Vault Secret
    key_vault_secret_content_type        = ""                           #(Optional) Specifies the content type for the Key Vault Secret
    key_vault_secret_not_before_date     = null                         #(Optional) Specifies that the key is not usable before the provided UTC datetime (Y-m-d'T'H:M:S'Z')
    key_vault_secret_expiration_date     = null                         #(Optional) Specifies the expiration UTC datetime (Y-m-d'T'H:M:S'Z').
    key_vault_secret_resource_group_name = "ploceusrg000001"            #(Required) Specifies the name of the resource group, where the key_vault resides in
    key_vault_secret_name                = "ploceuskvsecretad000001"    #(Required) Specifies the name of the Key Vault Secret. Changing this forces a new resource to be created


    key_vault_secret_tags = { #(Optional) A mapping of tags which should be assigned to the key vault secret.

      Created_By = "Ploceus",
      Department = "CIS"
    }
    key_vault_secret_min_upper   = 10 #(Optional)(Number) Minimum number of uppercase alphabet characters in the result. Default value is 0
    key_vault_secret_min_lower   = 5  #(Optional)(Number) Minimum number of lowercase alphabet characters in the result. Default value is 0
    key_vault_secret_min_numeric = 5  #(Optional)(Number) Minimum number of numeric characters in the result. Default value is 0
    key_vault_secret_min_special = 3  #(Optional)(Number) Minimum number of special characters in the result. Default value is 0
    key_vault_secret_length      = 32 #(Optional)(Number) The length of the string desired. The minimum value for length is 1 and, length must also be >= (min_upper + min_lower + min_numeric + min_special)
  },
  "key_vault_secret_2" = {
    key_vault_name                       = "ploceuskeyvault000001"      #(Required) Specifies the name of the Key Vault.
    key_vault_secret_value               = "connectionstringmysql01"    #(Required) Specifies the value of the Key Vault Secret
    key_vault_secret_content_type        = ""                           #(Optional) Specifies the content type for the Key Vault Secret
    key_vault_secret_not_before_date     = null                         #(Optional) Specifies that the key is not usable before the provided UTC datetime (Y-m-d'T'H:M:S'Z')
    key_vault_secret_expiration_date     = null                         #(Optional) Specifies the expiration UTC datetime (Y-m-d'T'H:M:S'Z').
    key_vault_secret_resource_group_name = "ploceusrg000001"            #(Required) Specifies the name of the resource group, where the key_vault resides in
    key_vault_secret_name                = "ploceuskvsecretmysql000001" #(Required) Specifies the name of the Key Vault Secret. Changing this forces a new resource to be created


    key_vault_secret_tags = { #(Optional) A mapping of tags which should be assigned to the key vault secret.

      Created_By = "Ploceus",
      Department = "CIS"
    }
    key_vault_secret_min_upper   = 10 #(Optional)(Number) Minimum number of uppercase alphabet characters in the result. Default value is 0
    key_vault_secret_min_lower   = 5  #(Optional)(Number) Minimum number of lowercase alphabet characters in the result. Default value is 0
    key_vault_secret_min_numeric = 5  #(Optional)(Number) Minimum number of numeric characters in the result. Default value is 0
    key_vault_secret_min_special = 3  #(Optional)(Number) Minimum number of special characters in the result. Default value is 0
    key_vault_secret_length      = 32 #(Optional)(Number) The length of the string desired. The minimum value for length is 1 and, length must also be >= (min_upper + min_lower + min_numeric + min_special)
  },
  "key_vault_secret_3" = {
    key_vault_name                       = "ploceuskeyvault000001"     #(Required) Specifies the name of the Key Vault.
    key_vault_secret_value               = "authsettingfacebookpasswd" #(Required) Specifies the value of the Key Vault Secret
    key_vault_secret_content_type        = ""                          #(Optional) Specifies the content type for the Key Vault Secret
    key_vault_secret_not_before_date     = null                        #(Optional) Specifies that the key is not usable before the provided UTC datetime (Y-m-d'T'H:M:S'Z')
    key_vault_secret_expiration_date     = null                        #(Optional) Specifies the expiration UTC datetime (Y-m-d'T'H:M:S'Z').
    key_vault_secret_resource_group_name = "ploceusrg000001"           #(Required) Specifies the name of the resource group, where the key_vault resides in
    key_vault_secret_name                = "ploceuskvsecretfb000001"   #(Required) Specifies the name of the Key Vault Secret. Changing this forces a new resource to be created


    key_vault_secret_tags = { #(Optional) A mapping of tags which should be assigned to the key vault secret.

      Created_By = "Ploceus",
      Department = "CIS"
    }
    key_vault_secret_min_upper   = 10 #(Optional)(Number) Minimum number of uppercase alphabet characters in the result. Default value is 0
    key_vault_secret_min_lower   = 5  #(Optional)(Number) Minimum number of lowercase alphabet characters in the result. Default value is 0
    key_vault_secret_min_numeric = 5  #(Optional)(Number) Minimum number of numeric characters in the result. Default value is 0
    key_vault_secret_min_special = 3  #(Optional)(Number) Minimum number of special characters in the result. Default value is 0
    key_vault_secret_length      = 32 #(Optional)(Number) The length of the string desired. The minimum value for length is 1 and, length must also be >= (min_upper + min_lower + min_numeric + min_special)
  }
}

#KEY VAULT ACCESS POLICY
key_vault_access_policy_variables = {
  "key_vault_access_policy_1" = {
    key_vault_access_policy_key_permissions         = ["Get", "List", "Create", "Delete", "Recover", "Backup", "Restore", "Purge"]                                                                                                                    #(Optional) List of key permissions, must be one or more from the following: Backup, Create, Decrypt, Delete, Encrypt, Get, Import, List, Purge, Recover, Restore, Sign, UnwrapKey, Update, Verify, WrapKey, Release, Rotate, GetRotationPolicy, and SetRotationPolicy.
    key_vault_access_policy_secret_permissions      = ["Get", "List", "Delete", "Recover", "Backup", "Restore", "Purge", "Set"]                                                                                                                       #(Optional) List of secret permissions, must be one or more from the following: Backup, Delete, Get, List, Purge, Recover, Restore and Set.
    key_vault_access_policy_storage_permissions     = []                                                                                                                                                                                              #(Optional) List of storage permissions, must be one or more from the following: Backup, Delete, DeleteSAS, Get, GetSAS, List, ListSAS, Purge, Recover, RegenerateKey, Restore, Set, SetSAS and Update.
    key_vault_access_policy_certificate_permissions = ["Backup", "Create", "Delete", "DeleteIssuers", "Get", "GetIssuers", "Import", "List", "ListIssuers", "ManageContacts", "ManageIssuers", "Purge", "Recover", "Restore", "SetIssuers", "Update"] #(Optional) List of certificate permissions, must be one or more from the following: Backup, Create, Delete, DeleteIssuers, Get, GetIssuers, Import, List, ListIssuers, ManageContacts, ManageIssuers, Purge, Recover, Restore, SetIssuers and Update.
    key_vault_name                                  = "ploceuskeyvault000001"                                                                                                                                                                         #(Required) Specifies the name of the Key Vault resource.
    key_vault_resource_group_name                   = "ploceusrg000001"                                                                                                                                                                               #(Required) Specifies the resource group name where the key vault resides in.
    key_vault_access_resource_name                  = "xxxxxxxxxx@ploceus.com"                                                                                                                                                                        #(Required) Specifies the resource name that needs an access policy to the key vault. Possible values are username, group name, service principal name and application name

    key_vault_access_resource_type = "User" #(Required) Specifies the type of resource that needs the access policy to the key vault. Possible values are User, SPN, Group, Application
  }
}

#User Assigned Identity VARIABLES
user_assigned_identity_variables = {
  "user_assigned_identity_1" = {
    user_assigned_identity_name                = "ploceusuai000001" #(Required) Specifies the name of this User Assigned Identity. Changing this forces a new User Assigned Identity to be created.
    user_assigned_identity_location            = "eastus"           # (Required) The Azure Region where the User Assigned Identity should exist. Changing this forces a new User Assigned Identity to be created.
    user_assigned_identity_resource_group_name = "ploceusrg000001"  #Required) Specifies the name of the Resource Group within which this User Assigned Identity should exist. Changing this forces a new User Assigned Identity to be created.
    #(Optional) A mapping of tags which should be assigned to the User Assigned Identity.
    user_assigned_identity_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    } #(Optional) A mapping of tags which should be assigned to the User Assigned Identity.
  },
  "user_assigned_identity_2" = {
    user_assigned_identity_name                = "ploceusuai000002" #(Required) Specifies the name of this User Assigned Identity. Changing this forces a new User Assigned Identity to be created.
    user_assigned_identity_location            = "eastus"           # (Required) The Azure Region where the User Assigned Identity should exist. Changing this forces a new User Assigned Identity to be created.
    user_assigned_identity_resource_group_name = "ploceusrg000001"  #Required) Specifies the name of the Resource Group within which this User Assigned Identity should exist. Changing this forces a new User Assigned Identity to be created.
    #(Optional) A mapping of tags which should be assigned to the User Assigned Identity.
    user_assigned_identity_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    } #(Optional) A mapping of tags which should be assigned to the User Assigned Identity.
  }
}

#NETWORK SECURITY GROUP
network_security_group_variables = {
  "network_security_group_1" = {
    network_security_group_name                = "ploceusnsg000001" # (Required) Specifies the name of the network security group
    network_security_group_resource_group_name = "ploceusrg000001"  # (Required) The name of the resource group in which to create the network security group
    network_security_group_location            = "eastus"           # (Required) Specifies the supported Azure location where the resource exists
    network_security_group_security_rule = {                        # (Optional) Map of objects representing security rules
      "nsg_rule_01" = {
        security_rule_name                                           = "ploceusnsgrule000001" # (Required) The name of the security rule
        security_rule_application_security_group_resource_group_name = null                   # (Optional) The resource group name of the application security group
        security_rule_priority                                       = 100                    # (Required) Specifies the priority of the rule. The value can be between 100 and 4096. The priority number must be unique for each rule in the collection. The lower the priority number, the higher the priority of the rule.
        security_rule_direction                                      = "Inbound"              # (Required) The direction specifies if rule will be evaluated on incoming or outgoing traffic. Possible values are Inbound and Outbound.
        security_rule_access                                         = "Allow"                # (Required) Specifies whether network traffic is allowed or denied. Possible values are Allow and Deny.
        security_rule_protocol                                       = "Tcp"                  # (Required) Network protocol this rule applies to. Possible values include Tcp, Udp, Icmp, Esp, Ah or * (which matches all).
        security_rule_source_port_range                              = "*"                    # (Optional) Source Port or Range. Integer or range between 0 and 65535 or * to match any. This is required if source_port_ranges is not specified
        security_rule_source_port_ranges                             = null                   # (Optional) List of source ports or port ranges. This is required if source_port_range is not specified
        security_rule_destination_port_range                         = "*"                    # (Optional) Destination Port or Range. Integer or range between 0 and 65535 or * to match any. This is required if destination_port_ranges is not specified.
        security_rule_destination_port_ranges                        = null                   # (Optional) List of destination ports or port ranges. This is required if destination_port_range is not specified
        security_rule_source_address_prefix                          = "*"                    # (Optional) CIDR or source IP range or * to match any IP. Tags such as ‘VirtualNetwork’, ‘AzureLoadBalancer’ and ‘Internet’ can also be used. This is required if source_address_prefixes is not specified.
        security_rule_source_address_prefixes                        = null                   # (Optional) List of source address prefixes. Tags may not be used. This is required if source_address_prefix is not specified.
        security_rule_destination_address_prefix                     = "*"                    # (Optional) CIDR or destination IP range or * to match any IP. Tags such as ‘VirtualNetwork’, ‘AzureLoadBalancer’ and ‘Internet’ can also be used. This is required if destination_address_prefixes is not specified.
        security_rule_destination_address_prefixes                   = null                   # (Optional) List of destination address prefixes. Tags may not be used. This is required if destination_address_prefix is not specified.
        security_rule_description                                    = "InboundAllow100"      # (Optional) A description for this rule. Restricted to 140 characters
        security_rule_source_application_security_group_names        = null                   # (Optional) A List of source Application Security Group names
        security_rule_destination_application_security_group_names   = null                   # (Optional) A List of destination Application Security Group names
    } }
    network_security_group_tags = { #(Optional) A mapping of tags which should be assigned to the Network Security Group.
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}

#Virtual Network 
virtual_network_variables = {
  "virtual_network_1" = {
    virtual_network_name                    = "ploceusvnet000001" #(Required) The name of the virtual network.
    virtual_network_location                = "eastus"            #(Required) The location/region where the virtual network is created.
    virtual_network_resource_group_name     = "ploceusrg000001"   #(Required) The name of the resource group in which to create the virtual network.
    virtual_network_address_space           = ["10.0.0.0/16"]     #(Required) The address space that is used the virtual network.
    virtual_network_dns_servers             = null                #(Optional) List of IP addresses of DNS servers.Since dns_servers can be configured both inline and via the separate azurerm_virtual_network_dns_servers resource, we have to explicitly set it to empty slice ([]) to remove it.
    virtual_network_flow_timeout_in_minutes = null                #(Optional) The flow timeout in minutes for the Virtual Network, which is used to enable connection tracking for intra-VM flows. Possible values are between 4 and 30 minutes.
    virtual_network_bgp_community           = null                #(Optional) The BGP community attribute in format <as-number>:<community-value>.The as-number segment is the Microsoft ASN, which is always 12076 for now.
    virtual_network_edge_zone               = null                #(Optional) Specifies the Edge Zone within the Azure Region where this Virtual Network should exist. Changing this forces a new Virtual Network to be created.
    virtual_network_ddos_protection_plan = {                      #(Optional block) provide true for virtual_network_ddos_protection_enable incase ddos_protection needs to be enabled.
      virtual_network_ddos_protection_enable    = false           #(Required) Enable/disable DDoS Protection Plan on Virtual Network.
      virtual_network_ddos_protection_plan_name = null            #(Required) Needed for ddos protection plan id.Provide the name of the ddos protection plan if above enable is true
    }
    virtual_network_subnet = null
    virtual_network_tags = { #(Optional) A mapping of tags which should be assigned to the virtual network.
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}

#Subnets
subnet_variables = {
  "subnet_1" = {
    subnet_name                                           = "ploceussubnet000001"                                   # (Required) The name of the subnet. Changing this forces a new resource to be created.
    subnet_resource_group_name                            = "ploceusrg000001"                                       #(Required) The name of the resource group in which to create the subnet. Changing this forces a new resource to be created.
    subnet_address_prefixes                               = ["10.0.3.0/24"]                                         #(Required) The address prefixes to use for the subnet.
    subnet_virtual_network_name                           = "ploceusvnet000001"                                     #(Required) The name of the virtual network to which to attach the subnet. Changing this forces a new resource to be created.
    subnet_private_link_service_network_policies_enabled  = null                                                    # (Optional) Enable or Disable network policies for the private link service on the subnet. Setting this to true will Enable the policy and setting this to false will Disable the policy. Defaults to true.
    subnet_private_endpoint_network_policies_enabled      = null                                                    # (Optional) Enable or Disable network policies for the private endpoint on the subnet. Setting this to true will Enable the policy and setting this to false will Disable the policy. Defaults to true.
    subnet_enforce_private_link_endpoint_network_policies = null                                                    #(Optional) Enable or Disable network policies for the private link endpoint on the subnet. Setting this to true will Disable the policy and setting this to false will Enable the policy. Default value is false.
    subnet_enforce_private_link_service_network_policies  = null                                                    #(Optional) Enable or Disable network policies for the private link service on the subnet. Setting this to true will Disable the policy and setting this to false will Enable the policy. Default value is false.
    subnet_service_endpoint_policy_ids                    = null                                                    #(Optional) The list of IDs of Service Endpoint Policies to associate with the subnet.
    subnet_service_endpoints                              = ["Microsoft.AzureActiveDirectory", "Microsoft.Storage"] #(Optional) The list of Service endpoints to associate with the subnet. Possible values include: Microsoft.AzureActiveDirectory, Microsoft.AzureCosmosDB, Microsoft.ContainerRegistry, Microsoft.EventHub, Microsoft.KeyVault, Microsoft.ServiceBus, Microsoft.Sql, Microsoft.Storage and Microsoft.Web.
    delegation = [{
      delegation_name            = "delegation000001"                                                                                                                                                                                                #(Required) A name for this delegation.
      service_delegation_name    = "Microsoft.Web/serverFarms"                                                                                                                                                                                       # (Required) The name of service to delegate to. Possible values include Microsoft.ApiManagement/service, Microsoft.AzureCosmosDB/clusters, Microsoft.BareMetal/AzureVMware, Microsoft.BareMetal/CrayServers, Microsoft.Batch/batchAccounts, Microsoft.ContainerInstance/containerGroups, Microsoft.ContainerService/managedClusters, Microsoft.Databricks/workspaces, Microsoft.DBforMySQL/flexibleServers, Microsoft.DBforMySQL/serversv2, Microsoft.DBforPostgreSQL/flexibleServers, Microsoft.DBforPostgreSQL/serversv2, Microsoft.DBforPostgreSQL/singleServers, Microsoft.HardwareSecurityModules/dedicatedHSMs, Microsoft.Kusto/clusters, Microsoft.Logic/integrationServiceEnvironments, Microsoft.LabServices/labplans,Microsoft.MachineLearningServices/workspaces, Microsoft.Netapp/volumes, Microsoft.Network/managedResolvers, Microsoft.Orbital/orbitalGateways, Microsoft.PowerPlatform/vnetaccesslinks, Microsoft.ServiceFabricMesh/networks, Microsoft.Sql/managedInstances, Microsoft.Sql/servers, Microsoft.StoragePool/diskPools, Microsoft.StreamAnalytics/streamingJobs, Microsoft.Synapse/workspaces, Microsoft.Web/hostingEnvironments, Microsoft.Web/serverFarms, NGINX.NGINXPLUS/nginxDeployments and PaloAltoNetworks.Cloudngfw/firewalls.
      service_delegation_actions = ["Microsoft.Network/virtualNetworks/subnets/join/action", "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action", "Microsoft.Network/virtualNetworks/subnets/unprepareNetworkPolicies/action"] #(Optional) A list of Actions which should be delegated. This list is specific to the service to delegate to. Possible values include Microsoft.Network/publicIPAddresses/read,Microsoft.Network/virtualNetworks/read,Microsoft.Network/networkinterfaces/*, Microsoft.Network/virtualNetworks/subnets/action, Microsoft.Network/virtualNetworks/subnets/join/action, Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action and Microsoft.Network/virtualNetworks/subnets/unprepareNetworkPolicies/action.
    }]
  },
  "subnet_2" = {
    subnet_name                                           = "ploceussubnet000002"                       # (Required) The name of the subnet. Changing this forces a new resource to be created.
    subnet_resource_group_name                            = "ploceusrg000001"                           #(Required) The name of the resource group in which to create the subnet. Changing this forces a new resource to be created.
    subnet_address_prefixes                               = ["10.0.4.0/24"]                             #(Required) The address prefixes to use for the subnet.
    subnet_virtual_network_name                           = "ploceusvnet000001"                         #(Required) The name of the virtual network to which to attach the subnet. Changing this forces a new resource to be created.
    subnet_private_link_service_network_policies_enabled  = null                                        # (Optional) Enable or Disable network policies for the private link service on the subnet. Setting this to true will Enable the policy and setting this to false will Disable the policy. Defaults to true.
    subnet_private_endpoint_network_policies_enabled      = null                                        # (Optional) Enable or Disable network policies for the private endpoint on the subnet. Setting this to true will Enable the policy and setting this to false will Disable the policy. Defaults to true.
    subnet_enforce_private_link_endpoint_network_policies = null                                        #(Optional) Enable or Disable network policies for the private link endpoint on the subnet. Setting this to true will Disable the policy and setting this to false will Enable the policy. Default value is false.
    subnet_enforce_private_link_service_network_policies  = null                                        #(Optional) Enable or Disable network policies for the private link service on the subnet. Setting this to true will Disable the policy and setting this to false will Enable the policy. Default value is false.
    subnet_service_endpoint_policy_ids                    = null                                        #(Optional) The list of IDs of Service Endpoint Policies to associate with the subnet.
    subnet_service_endpoints                              = ["Microsoft.KeyVault", "Microsoft.Storage"] #(Optional) The list of Service endpoints to associate with the subnet. Possible values include: Microsoft.AzureActiveDirectory, Microsoft.AzureCosmosDB, Microsoft.ContainerRegistry, Microsoft.EventHub, Microsoft.KeyVault, Microsoft.ServiceBus, Microsoft.Sql, Microsoft.Storage and Microsoft.Web.
    delegation = [{
      delegation_name            = "delegation000002"                                                                                                                                                                                                #(Required) A name for this delegation.
      service_delegation_name    = "Microsoft.Sql/managedInstances"                                                                                                                                                                                  # (Required) The name of service to delegate to. Possible values include Microsoft.ApiManagement/service, Microsoft.AzureCosmosDB/clusters, Microsoft.BareMetal/AzureVMware, Microsoft.BareMetal/CrayServers, Microsoft.Batch/batchAccounts, Microsoft.ContainerInstance/containerGroups, Microsoft.ContainerService/managedClusters, Microsoft.Databricks/workspaces, Microsoft.DBforMySQL/flexibleServers, Microsoft.DBforMySQL/serversv2, Microsoft.DBforPostgreSQL/flexibleServers, Microsoft.DBforPostgreSQL/serversv2, Microsoft.DBforPostgreSQL/singleServers, Microsoft.HardwareSecurityModules/dedicatedHSMs, Microsoft.Kusto/clusters, Microsoft.Logic/integrationServiceEnvironments, Microsoft.LabServices/labplans,Microsoft.MachineLearningServices/workspaces, Microsoft.Netapp/volumes, Microsoft.Network/managedResolvers, Microsoft.Orbital/orbitalGateways, Microsoft.PowerPlatform/vnetaccesslinks, Microsoft.ServiceFabricMesh/networks, Microsoft.Sql/managedInstances, Microsoft.Sql/servers, Microsoft.StoragePool/diskPools, Microsoft.StreamAnalytics/streamingJobs, Microsoft.Synapse/workspaces, Microsoft.Web/hostingEnvironments, Microsoft.Web/serverFarms, NGINX.NGINXPLUS/nginxDeployments and PaloAltoNetworks.Cloudngfw/firewalls.
      service_delegation_actions = ["Microsoft.Network/virtualNetworks/subnets/join/action", "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action", "Microsoft.Network/virtualNetworks/subnets/unprepareNetworkPolicies/action"] #(Optional) A list of Actions which should be delegated. This list is specific to the service to delegate to. Possible values include Microsoft.Network/publicIPAddresses/read,Microsoft.Network/virtualNetworks/read,Microsoft.Network/networkinterfaces/*, Microsoft.Network/virtualNetworks/subnets/action, Microsoft.Network/virtualNetworks/subnets/join/action, Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action and Microsoft.Network/virtualNetworks/subnets/unprepareNetworkPolicies/action.
    }]
  },
  "subnet_3" = {
    subnet_name                                           = "ploceussn000001"                                                 # (Required) The name of the subnet. Changing this forces a new resource to be created.
    subnet_resource_group_name                            = "ploceusrg000001"                                                 #(Required) The name of the resource group in which to create the subnet. Changing this forces a new resource to be created.
    subnet_address_prefixes                               = ["10.0.5.0/24"]                                                   #(Required) The address prefixes to use for the subnet.
    subnet_virtual_network_name                           = "ploceusvnet000001"                                               #(Required) The name of the virtual network to which to attach the subnet. Changing this forces a new resource to be created.
    subnet_private_link_service_network_policies_enabled  = null                                                              # (Optional) Enable or Disable network policies for the private link service on the subnet. Setting this to true will Enable the policy and setting this to false will Disable the policy. Defaults to true.
    subnet_private_endpoint_network_policies_enabled      = null                                                              # (Optional) Enable or Disable network policies for the private endpoint on the subnet. Setting this to true will Enable the policy and setting this to false will Disable the policy. Defaults to true.
    subnet_enforce_private_link_endpoint_network_policies = null                                                              #(Optional) Enable or Disable network policies for the private link endpoint on the subnet. Setting this to true will Disable the policy and setting this to false will Enable the policy. Default value is false.
    subnet_enforce_private_link_service_network_policies  = null                                                              #(Optional) Enable or Disable network policies for the private link service on the subnet. Setting this to true will Disable the policy and setting this to false will Enable the policy. Default value is false.
    subnet_service_endpoint_policy_ids                    = null                                                              #(Optional) The list of IDs of Service Endpoint Policies to associate with the subnet.
    subnet_service_endpoints                              = ["Microsoft.AzureActiveDirectory", "Microsoft.ContainerRegistry"] #(Optional) The list of Service endpoints to associate with the subnet. Possible values include: Microsoft.AzureActiveDirectory, Microsoft.AzureCosmosDB, Microsoft.ContainerRegistry, Microsoft.EventHub, Microsoft.KeyVault, Microsoft.ServiceBus, Microsoft.Sql, Microsoft.Storage and Microsoft.Web.
    delegation = [{
      delegation_name            = "delegation000003"                                                                                                                                                                                                #(Required) A name for this delegation.
      service_delegation_name    = "Microsoft.Sql/managedInstances"                                                                                                                                                                                  # (Required) The name of service to delegate to. Possible values include Microsoft.ApiManagement/service, Microsoft.AzureCosmosDB/clusters, Microsoft.BareMetal/AzureVMware, Microsoft.BareMetal/CrayServers, Microsoft.Batch/batchAccounts, Microsoft.ContainerInstance/containerGroups, Microsoft.ContainerService/managedClusters, Microsoft.Databricks/workspaces, Microsoft.DBforMySQL/flexibleServers, Microsoft.DBforMySQL/serversv2, Microsoft.DBforPostgreSQL/flexibleServers, Microsoft.DBforPostgreSQL/serversv2, Microsoft.DBforPostgreSQL/singleServers, Microsoft.HardwareSecurityModules/dedicatedHSMs, Microsoft.Kusto/clusters, Microsoft.Logic/integrationServiceEnvironments, Microsoft.LabServices/labplans,Microsoft.MachineLearningServices/workspaces, Microsoft.Netapp/volumes, Microsoft.Network/managedResolvers, Microsoft.Orbital/orbitalGateways, Microsoft.PowerPlatform/vnetaccesslinks, Microsoft.ServiceFabricMesh/networks, Microsoft.Sql/managedInstances, Microsoft.Sql/servers, Microsoft.StoragePool/diskPools, Microsoft.StreamAnalytics/streamingJobs, Microsoft.Synapse/workspaces, Microsoft.Web/hostingEnvironments, Microsoft.Web/serverFarms, NGINX.NGINXPLUS/nginxDeployments and PaloAltoNetworks.Cloudngfw/firewalls.
      service_delegation_actions = ["Microsoft.Network/virtualNetworks/subnets/join/action", "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action", "Microsoft.Network/virtualNetworks/subnets/unprepareNetworkPolicies/action"] #(Optional) A list of Actions which should be delegated. This list is specific to the service to delegate to. Possible values include Microsoft.Network/publicIPAddresses/read,Microsoft.Network/virtualNetworks/read,Microsoft.Network/networkinterfaces/*, Microsoft.Network/virtualNetworks/subnets/action, Microsoft.Network/virtualNetworks/subnets/join/action, Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action and Microsoft.Network/virtualNetworks/subnets/unprepareNetworkPolicies/action.
    }]
  },
  "subnet_4" = {
    subnet_name                                           = "ploceussn000002"                                                 # (Required) The name of the subnet. Changing this forces a new resource to be created.
    subnet_resource_group_name                            = "ploceusrg000001"                                                 #(Required) The name of the resource group in which to create the subnet. Changing this forces a new resource to be created.
    subnet_address_prefixes                               = ["10.0.6.0/24"]                                                   #(Required) The address prefixes to use for the subnet.
    subnet_virtual_network_name                           = "ploceusvnet000001"                                               #(Required) The name of the virtual network to which to attach the subnet. Changing this forces a new resource to be created.
    subnet_private_link_service_network_policies_enabled  = null                                                              # (Optional) Enable or Disable network policies for the private link service on the subnet. Setting this to true will Enable the policy and setting this to false will Disable the policy. Defaults to true.
    subnet_private_endpoint_network_policies_enabled      = null                                                              # (Optional) Enable or Disable network policies for the private endpoint on the subnet. Setting this to true will Enable the policy and setting this to false will Disable the policy. Defaults to true.
    subnet_enforce_private_link_endpoint_network_policies = null                                                              #(Optional) Enable or Disable network policies for the private link endpoint on the subnet. Setting this to true will Disable the policy and setting this to false will Enable the policy. Default value is false.
    subnet_enforce_private_link_service_network_policies  = null                                                              #(Optional) Enable or Disable network policies for the private link service on the subnet. Setting this to true will Disable the policy and setting this to false will Enable the policy. Default value is false.
    subnet_service_endpoint_policy_ids                    = null                                                              #(Optional) The list of IDs of Service Endpoint Policies to associate with the subnet.
    subnet_service_endpoints                              = ["Microsoft.AzureActiveDirectory", "Microsoft.ContainerRegistry"] #(Optional) The list of Service endpoints to associate with the subnet. Possible values include: Microsoft.AzureActiveDirectory, Microsoft.AzureCosmosDB, Microsoft.ContainerRegistry, Microsoft.EventHub, Microsoft.KeyVault, Microsoft.ServiceBus, Microsoft.Sql, Microsoft.Storage and Microsoft.Web.
    delegation = [{
      delegation_name            = "delegation000004"                                                                                                                                                                                                #(Required) A name for this delegation.
      service_delegation_name    = "Microsoft.Sql/managedInstances"                                                                                                                                                                                  # (Required) The name of service to delegate to. Possible values include Microsoft.ApiManagement/service, Microsoft.AzureCosmosDB/clusters, Microsoft.BareMetal/AzureVMware, Microsoft.BareMetal/CrayServers, Microsoft.Batch/batchAccounts, Microsoft.ContainerInstance/containerGroups, Microsoft.ContainerService/managedClusters, Microsoft.Databricks/workspaces, Microsoft.DBforMySQL/flexibleServers, Microsoft.DBforMySQL/serversv2, Microsoft.DBforPostgreSQL/flexibleServers, Microsoft.DBforPostgreSQL/serversv2, Microsoft.DBforPostgreSQL/singleServers, Microsoft.HardwareSecurityModules/dedicatedHSMs, Microsoft.Kusto/clusters, Microsoft.Logic/integrationServiceEnvironments, Microsoft.LabServices/labplans,Microsoft.MachineLearningServices/workspaces, Microsoft.Netapp/volumes, Microsoft.Network/managedResolvers, Microsoft.Orbital/orbitalGateways, Microsoft.PowerPlatform/vnetaccesslinks, Microsoft.ServiceFabricMesh/networks, Microsoft.Sql/managedInstances, Microsoft.Sql/servers, Microsoft.StoragePool/diskPools, Microsoft.StreamAnalytics/streamingJobs, Microsoft.Synapse/workspaces, Microsoft.Web/hostingEnvironments, Microsoft.Web/serverFarms, NGINX.NGINXPLUS/nginxDeployments and PaloAltoNetworks.Cloudngfw/firewalls.
      service_delegation_actions = ["Microsoft.Network/virtualNetworks/subnets/join/action", "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action", "Microsoft.Network/virtualNetworks/subnets/unprepareNetworkPolicies/action"] #(Optional) A list of Actions which should be delegated. This list is specific to the service to delegate to. Possible values include Microsoft.Network/publicIPAddresses/read,Microsoft.Network/virtualNetworks/read,Microsoft.Network/networkinterfaces/*, Microsoft.Network/virtualNetworks/subnets/action, Microsoft.Network/virtualNetworks/subnets/join/action, Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action and Microsoft.Network/virtualNetworks/subnets/unprepareNetworkPolicies/action.
    }]
  }
}

#API Management Variables
api_management_variables = {
  api_1 = {
    api_management_name                                      = "ploceusapim000001"      #(Required) The name of the API Management Service. Changing this forces a new resource to be created.
    api_management_location                                  = "eastus"                 #(Required) The Azure location where the API Management Service exists. Changing this forces a new resource to be created.
    api_management_resource_group_name                       = "ploceusrg000001"        #(Required) The name of the Resource Group in which the API Management Service should be exist. Changing this forces a new resource to be created.
    api_management_publisher_name                            = "ploceus"                #(Required) The name of publisher/company.
    api_management_publisher_email                           = "xxxxxxxxxx@ploceus.com" #(Required) The email of publisher/company.
    api_management_sku_name                                  = "Standard_1"             #(Required) sku_name is a string consisting of two parts separated by an underscore(_). The first part is the name, valid values include: Consumption, Developer, Basic, Standard and Premium. The second part is the capacity (e.g. the number of deployed units of the sku), which must be a positive integer (e.g. Developer_1).
    api_management_additional_location                       = null
    api_management_certificate_key_vault_name                = null #(Optional) Only required if api_management_certificate block is passed. The key vault where Base64 encoded certificate and certificate password is stored
    api_management_certificate_key_vault_resource_group_name = null #(Optional) Only required if api_management_certificate block is passed. The key vault resource group, where Base64 encoded certificate and certificate password is stored
    api_management_certificate                               = null
    api_management_client_certificate_enabled                = null  #(Optional) Enforce a client certificate to be presented on each request to the gateway? This is only supported when SKU type is Consumption.
    api_management_gateway_disabled                          = false #(Optional) Disable the gateway in main region? This is only supported when additional_location is set.
    api_management_min_api_version                           = null  #(Optional) The version which the control plane API calls to API Management service are limited with version equal to or newer than.
    api_management_zones                                     = null  #(Optional) Specifies a list of Availability Zones in which this API Management service should be located. Changing this forces a new API Management service to be created.
    api_management_identity = {
      identity_type                     = "SystemAssigned"
      identity_user_assigned_identities = null
      /*Sample Code
      [{                   #(Optional) A list of User Assigned Managed Identity IDs to be assigned to this API Management Service. This is required when type is set to UserAssigned or SystemAssigned, UserAssigned.
        user_identity_name                = "ploceusuai000001" #user assigned identity name Required if identity type ="systemassigned" or "systemassigned,userassigned"
        user_identity_resource_group_name = "ploceusrg000001"  #resource group name of the user identity
      }]*/
    }
    api_management_hostname_configuration = null #(Optional) A hostname_configuration block as defined below.
    /*Sample Code
      hostname_configuration_key_vault_name                              = null #(Optional) The name of the Key Vault containing the SSL Certificate, which must be should be of the type application/x-pkcs12.
      hostname_configuration_key_vault_resource_group_name               = null #(Optional) The resource group of the Key Vault Secret containing the SSL Certificate, which must be should be of the type application/x-pkcs12.
      hostname_configuration_ssl_keyvault_identity_client_type           = null  # Possible values are SystemAssigned, UserAssigned
      hostname_configuration_ssl_keyvault_identity_client_id             = null
      hostname_configuration_ssl_keyvault_identity_client_name           = null #(Optional) The client id of the System or User Assigned Managed identity generated by Azure AD, which has GET access to the keyVault containing the SSL certificate. If User Assigned Managed identity is used in this field, please assign User Assigned Managed identity to the azurerm_api_management as well.
      hostname_configuration_ssl_keyvault_identity_client_resource_group = null #(Optional) The client id of the System or User Assigned Managed identity generated by Azure AD, which has GET access to the keyVault containing the SSL certificate. If User Assigned Managed identity is used in this field, please assign User Assigned Managed identity to the azurerm_api_management as well.
      hostname_configuration_management = [{                          #(Optional) One or more management blocks as documented below.
        management_host_name                    = "ploceushost000001" #(Required) The Hostname to use for the Management API.
        management_key_vault_secret_name        = null  #(Optional) The name of the Key Vault Secret containing the SSL Certificate, which must be should be of the type application/x-pkcs12. Setting this field requires the identity block to be specified, since this identity is used for to retrieve the Key Vault Certificate. Auto-updating the Certificate from the Key Vault requires the Secret version isn't specified.
        management_negotiate_client_certificate = false               #(Optional) Should Client Certificate Negotiation be enabled for this Hostname? Defaults to false.
        },
        {                                                               #(Optional) One or more management blocks as documented below.
          management_host_name                    = "ploceushost000002" #(Required) The Hostname to use for the Management API.
          management_key_vault_secret_name        = null  #(Optional) The name of the Key Vault Secret containing the SSL Certificate, which must be should be of the type application/x-pkcs12. Setting this field requires the identity block to be specified, since this identity is used for to retrieve the Key Vault Certificate. Auto-updating the Certificate from the Key Vault requires the Secret version isn't specified.
          management_negotiate_client_certificate = false               #(Optional) Should Client Certificate Negotiation be enabled for this Hostname? Defaults to false.
      }]
      hostname_configuration_portal = null
      hostname_configuration_developer_portal = null
      hostname_configuration_proxy = null
      hostname_configuration_scm = null
    }*/
    api_management_notification_sender_email = null #(Optional) Email address from which the notification will be sent.
    api_management_policy                    = null
    api_management_protocols                 = null
    api_management_security                  = null
    api_management_sign_in                   = null
    api_management_sign_up                   = null
    /* Sample Code
    {                                              #(Optional) A sign_up block as defined below.
      sign_up_enabled = true                       #(Required) Can users sign up on the development portal?
      sign_up_terms_of_service = {          #(Required) A terms_of_service block as defined below.
        terms_of_service_consent_required = true   #(Required) Should the user be asked for consent during sign up?
        terms_of_service_enabled          = true   #(Required) Should Terms of Service be displayed during sign up?.
        terms_of_service_text             = "Will Never pass the data" #(Required) The Terms of Service which users are required to agree to in order to sign up.
      }
    }*/
    api_management_tenant_access = { #(Optional) A tenant_access block as defined below.
      tenant_access_enabled = true   #(Required) Should the access to the management API be enabled?
    }
    api_management_public_ip_address_name                = null #(Optional) name of a standard SKU IPv4 Public IP.
    api_management_public_ip_address_resource_group_name = null #(Optional) resource group of a standard SKU IPv4 Public IP.
    api_management_public_network_access_enabled         = null #(Optional) Is public access to the service allowed?. Defaults to true
    api_management_virtual_network_type                  = null #(Optional) The type of virtual network you want to use, valid values include: None, External, Internal. virtual_network_type is Internal or External. And please ensure other necessary ports are open according to api management network configuration.
    api_management_virtual_network_configuration         = null #(Optional) A virtual_network_configuration block as defined below. Required when api_management_virtual_network_type is External or Internal.
    # {
    #   virtual_network_configuration_subnet_name                = "ploceussubnet000001" #(Required) The id of the subnet that will be used for the API Management.
    #   virtual_network_configuration_virtual_network_name       = "ploceusvnet000001"   #(Required) The id of the subnet that will be used for the API Management.
    #   virtual_network_configuration_subnet_resource_group_name = "ploceusrg000001"     #(Required) The id of the subnet that will be used for the API Management.
    # }
    api_management_tags = { #(Optional) A mapping of tags assigned to the resource.
      Created_By = "Ploceus"
      Department = "CIS"
    }
  }
}

#API MANAGEMENT API
api_management_api_variables = {
  "api_management_api_1" = {
    api_management_api_name                  = "ploceusapimapi000001" #(Required) The name of the API Management API. Changing this forces a new resource to be created.
    api_management_api_resource_group_name   = "ploceusrg000001"      #(Required) The Name of the Resource Group where the API Management API exists. Changing this forces a new resource to be created.
    api_management_api_api_management_name   = "ploceusapim000001"    #(Required) The Name of the API Management Service where this API should be created. Changing this forces a new resource to be created.
    api_management_api_api_type              = "http"                 #(Optional) Type of API. Possible values are graphql, http, soap, and websocket. Defaults to http
    api_management_api_revision              = "1"
    api_management_api_revision_description  = null                                                    #(Optional) The description of the API Revision of the API Management API.
    api_management_api_display_name          = "Ploceus API"                                           #(Optional) The display name of the API.
    api_management_api_description           = "API mangegment API resource to handle HTML tag"        #(Optional) A description of the API Management API, which may include HTML formatting tags.
    api_management_api_path                  = "ploceus"                                               #(Optional) The Path for this API Management API, which is a relative URL which uniquely identifies this API and all of its resource paths within the API Management Service.
    api_management_api_service_url           = null                                                    #(Optional) Absolute URL of the backend service implementing this API.
    api_management_api_protocols             = ["https"]                                               #(Optional) A list of protocols the operations in this API can be invoked. Possible values are http and https.
    api_management_api_soap_pass_through     = null                                                    #(Optional) Should this API expose a SOAP frontend, rather than a HTTP frontend? Defaults to false.
    api_management_api_subscription_required = false                                                   #(Optional) Should this API require a subscription key?
    api_management_api_version               = null                                                    #(Optional) The Version number of this API, if this API is versioned.
    api_management_api_version_set_id        = null                                                    #(Optional) The ID of the Version Set which this API is associated with.
    api_management_api_version_description   = null                                                    #(Optional) The description of the API Version of the API Management API.
    api_management_api_terms_of_service_url  = "http://conferenceapi.azurewebsites.net/?format=json"   #(Optional) Absolute URL of the Terms of Service for the API.
    api_management_api_source_api_id         = null                                                    #(Optional) The API id of the source API, which could be in format azurerm_api_management_api.example.id or in format azurerm_api_management_api.example.id;rev=1
    api_management_api_import = {                                                                      #(Optional) A import block as documented below.
      api_management_api_import_content_format = "swagger-link-json"                                   #(Required) The format of the content from which the API Definition should be imported. Possible values are: openapi, openapi+json, openapi+json-link, openapi-link, swagger-json, swagger-link-json, wadl-link-json, wadl-xml, wsdl and wsdl-link.
      api_management_api_import_content_value  = "http://conferenceapi.azurewebsites.net/?format=json" #(Required) The Content from which the API Definition should be imported. When a content_format of *-link-* is specified this must be a URL, otherwise this must be defined inline.
      api_management_api_import_wsdl_selector = {                                                      #(Optional) A wsdl_selector block as defined below, which allows you to limit the import of a WSDL to only a subset of the document. This can only be specified when content_format is wsdl or wsdl-link.
        import_wsdl_selector_service_name  = "sql"                                                     #(Required) The name of service to import from WSDL.
        import_wsdl_selector_endpoint_name = "http://conferenceapi.azurewebsites.net/?format=json"     #(Required) The name of endpoint (port) to import from WSDL.
      }
    }
    api_management_api_oauth2_authorization = null #(Optional) An oauth2_authorization block as documented below.
    /* Sample Code
    {
      oauth2_authorization_server_name = "ploceusapi-outh" #(Required) OAuth authorization server identifier. The name of an OAuth2 Authorization Server.
      oauth2_authorization_scope       = "sql" #(Optional) Operations scope.
    # }*/
    api_management_api_openid_authentication = null #(Optional) An openid_authentication block as documented below.
    /* Sample Code
{
      openid_authentication_openid_provider_name = "ploceusapi-open-id" #(Required) OpenID Connect provider identifier. The name of an OpenID Connect Provider.
      openid_authentication_bearer_token_sending_methods       = ["query"] #(Optional) How to send token to the server. A list of zero or more methods. Valid values are authorizationHeader and query.
    }*/
    api_management_api_subscription_key_parameter_names = {       #(Optional) A subscription_key_parameter_names block
      subscription_key_parameter_names_header = "ploceusapi-id"   #(Required) The name of the HTTP Header which should be used for the Subscription Key.
      subscription_key_parameter_names_query  = "ploceusapiquery" #(Required) The name of the QueryString parameter which should be used for the Subscription Key.
    }

    api_management_api_license = null # (Optional) A license block 
    /* Sample Code
     {
      license_name      = null #(Optional) The name of the license .
      license_url       = null #(Optional) Absolute URL of the license.
    }*/
    api_management_api_contact = null # (Optional) A contact block
    /* Sample Code
     {
      contact_email     = xxxx@ploceus.com #(Optional) The email address of the contact person/organization.
      contact_name      = Ploceus #(Optional) The name of the contact person/organization.
      contact_url       = https://ploceus.com #(Optional) Absolute URL of the contact information.
    }*/
  }

}

# STORAGE ACCOUNT
storage_account_variables = {
  "storage_account_01" = {
    storage_account_key_vault_name                                     = null                  #(Required) The name of the Key Vault.
    storage_account_key_vault_resource_group_name                      = null                  #(Required) The resource group name of the Key Vault.
    storage_account_key_vault_key_name                                 = null                  #(Required) The name of the Key Vault key required for customer managed key.
    storage_account_user_assigned_identity_name_for_cmk                = null                  #(Required) The name of a user assigned identity for customer managed key.
    storage_account_user_assigned_identity_resource_group_name_for_cmk = null                  #(Required) The resource group name of a user assigned identity for customer managed key.
    storage_account_identity_type_for_cmk                              = null                  #(Required) The identity type of a user assigned identity for customer managed key.Only Possible value could be "UserAssigned" in order to use customer managed key. Other Possible values are "SystemAssigned", "SystemAssigned, UserAssigned"
    storage_account_name                                               = "ploceusstracc000001" #(Required) Specifies the name of the storage account. Only lowercase Alphanumeric characters allowed.This must be unique across the entire Azure service, not just within the resource group.
    storage_account_resource_group_name                                = "ploceusrg000001"     #(Required) The name of the resource group in which to create the storage account.
    storage_account_location                                           = "eastus"              #(Required) Specifies the supported Azure location where the resource exists. 
    storage_account_account_kind                                       = "StorageV2"           #(Optional) Defines the Kind of account. Valid options are BlobStorage, BlockBlobStorage, FileStorage, Storage and StorageV2. Defaults to StorageV2.
    storage_account_account_tier                                       = "Standard"            #(Required) Defines the Tier to use for this storage account. Valid options are Standard and Premium. For BlockBlobStorage and FileStorage accounts only Premium is valid.
    storage_account_account_replication_type                           = "LRS"                 #(Required) Defines the type of replication to use for this storage account. Valid options are LRS, GRS, RAGRS, ZRS, GZRS and RAGZRS. Changing this forces a new resource to be created when types LRS, GRS and RAGRS are changed to ZRS, GZRS or RAGZRS and vice versa.
    storage_account_cross_tenant_replication_enabled                   = true                  #(Optional) Should cross Tenant replication be enabled? Defaults to true.
    storage_account_access_tier                                        = "Hot"                 #(Optional) Defines the access tier for BlobStorage, FileStorage and StorageV2 accounts. Valid options are Hot and Cool, defaults to Hot.
    storage_account_edge_zone                                          = null                  #(Optional) Specifies the Edge Zone within the Azure Region where this Storage Account should exist.
    storage_account_enable_https_traffic_only                          = true                  #(Optional) Boolean flag which forces HTTPS if enabled. Defaults to true.
    storage_account_min_tls_version                                    = "TLS1_2"              #(Optional) The minimum supported TLS version for the storage account. Possible values are TLS1_0, TLS1_1, and TLS1_2. Defaults to TLS1_2 for new storage accounts.
    storage_account_allow_nested_items_to_be_public                    = true                  #Allow or disallow nested items within this Account to opt into being public. Defaults to true.
    storage_account_shared_access_key_enabled                          = true                  #Indicates whether the storage account permits requests to be authorized with the account access key via Shared Key. If false, then all requests, including shared access signatures, must be authorized with Azure Active Directory (Azure AD). The default value is true.
    storage_account_public_network_access_enabled                      = true                  #(Optional) Whether the public network access is enabled? Defaults to true.
    storage_account_default_to_oauth_authentication                    = false                 #(Optional) Default to Azure Active Directory authorization in the Azure portal when accessing the Storage Account. The default value is false
    storage_account_is_hns_enabled                                     = false                 #(Optional) Is Hierarchical Namespace enabled? This can be used with Azure Data Lake Storage Gen 2.
    storage_account_nfsv3_enabled                                      = false                 #(Optional) Is NFSv3 protocol enabled? Defaults to false.
    storage_account_large_file_share_enabled                           = false                 #(Optional) Is Large File Share Enabled?
    storage_account_queue_encryption_key_type                          = "Service"             #(Optional) The encryption type of the queue service. Possible values are Service and Account.Default value is Service.
    storage_account_table_encryption_key_type                          = "Service"             #(Optional) The encryption type of the table service. Possible values are Service and Account. Default value is Service.
    storage_account_infrastructure_encryption_enabled                  = false                 #(Optional) Is infrastructure encryption enabled? Defaults to false.

    storage_account_custom_domain = null
    # storage_account_custom_domain = {
    #     custom_domain_name = "www.ploceus.com" #(Required) The Custom Domain Name to use for the Storage Account, which will be validated by Azure.
    #     custom_domain_use_subdomain = false #(Optional) Should the Custom Domain Name be validated by using indirect CNAME validation?
    # }

    storage_account_identity = null
    # storage_account_identity = {
    #   storage_account_identity_type = "UserAssigned" # Possible values could be "UserAssigned", "SystemAssigned", "SystemAssigned, UserAssigned"
    #   # storage_account_user_assigned_identity_ids = null
    #   storage_account_user_assigned_identity_ids = [{ # This is required when type is set to UserAssigned or SystemAssigned, UserAssigned.
    #     identity_name                = "ploceusuai000002"
    #     identity_resource_group_name = "ploceusrg000001"
    #   }]
    # }

    storage_account_blob_properties = null /* {
      versioning_enabled            = true         #(Optional) Is versioning enabled? Default to false.
      change_feed_enabled           = true         #(Optional) Is the blob service properties for change feed events enabled? Default to false.
      change_feed_retention_in_days = 7            #(Optional) The duration of change feed events retention in days. The possible values are between 1 and 146000 days (400 years). Setting this to null (or omit this in the configuration file) indicates an infinite retention of the change feed.
      default_service_version       = "2020-06-12" #(Optional) The API Version which should be used by default for requests to the Data Plane API if an incoming request doesn't specify an API Version. Defaults to 2020-06-12.
      last_access_time_enabled      = true         #(Optional) Is the last access time based tracking enabled? Default to false.

      cors_enabled = true #(optional) Should cross origin resource sharing be enabled.
      cors_rule = {
        allowed_headers    = ["*"]                                                                 #(Required) A list of headers that are allowed to be a part of the cross-origin request.
        allowed_methods    = ["DELETE", "GET", "HEAD", "MERGE", "POST", "OPTIONS", "PUT", "PATCH"] #(Required) A list of HTTP methods that are allowed to be executed by the origin. Valid options are DELETE, GET, HEAD, MERGE, POST, OPTIONS, PUT or PATCH.
        allowed_origins    = ["*"]                                                                 #(Required) A list of origin domains that will be allowed by CORS.
        exposed_headers    = ["*", ]                                                               #(Required) A list of response headers that are exposed to CORS clients.
        max_age_in_seconds = 60                                                                    #(Required) The number of seconds the client should cache a preflight response.
      }

      delete_retention_policy = {
        delete_retention_policy_days = "7" #(Optional) Specifies the number of days that the blob should be retained, between 1 and 365 days. Defaults to 7.
      }

      container_delete_retention_policy = {
        container_delete_retention_policy_days = "7" #(Optional) Specifies the number of days that the container should be retained, between 1 and 365 days. Defaults to 7.
      }
    } */

    storage_account_queue_properties = null /* {
      cors_enabled = true #(optional) Should cross origin resource sharing be enabled.
      cors_rule = {
        allowed_headers    = ["*"]                                   #(Required) A list of headers that are allowed to be a part of the cross-origin request.
        allowed_methods    = ["GET", "HEAD", "MERGE", "POST", "PUT"] #(Required) A list of HTTP methods that are allowed to be executed by the origin. Valid options are DELETE, GET, HEAD, MERGE, POST, OPTIONS, PUT or PATCH.
        allowed_origins    = ["*"]                                   #(Required) A list of origin domains that will be allowed by CORS.
        exposed_headers    = ["*"]                                   #(Required) A list of response headers that are exposed to CORS clients.
        max_age_in_seconds = 60                                      #(Required) The number of seconds the client should cache a preflight response.
      }

      logging_enabled = true #Should storage account queue properties logging be enabled.
      logging = {
        delete                = true  #(Required) Indicates whether all delete requests should be logged. 
        read                  = true  #(Required) Indicates whether all read requests should be logged. 
        version               = "1.0" #(Required) The version of storage analytics to configure.
        write                 = true  #(Required) Indicates whether all write requests should be logged.
        retention_policy_days = 7     #(Optional) Specifies the number of days that logs will be retained.
      }

      minute_metrics = {
        enabled               = true  #(Required) Indicates whether minute metrics are enabled for the Queue service. 
        version               = "1.0" #(Required) The version of storage analytics to configure. 
        include_apis          = true  #(Optional) Indicates whether metrics should generate summary statistics for called API operations.
        retention_policy_days = 7     #(Optional) Specifies the number of days that logs will be retained.
      }

      hour_metrics = {
        enabled               = true  #(Required) Indicates whether minute metrics are enabled for the Queue service. 
        version               = "1.0" #(Required) The version of storage analytics to configure. 
        include_apis          = true  #(Optional) Indicates whether metrics should generate summary statistics for called API operations.
        retention_policy_days = 7     #(Optional) Specifies the number of days that logs will be retained.
      }
    } */

    storage_account_static_website = null /* {
      index_document     = "index.html" #Optional) The webpage that Azure Storage serves for requests to the root of a website or any subfolder. For example, index.html. The value is case-sensitive.
      error_404_document = "404.html"   #(Optional) The absolute path to a custom webpage that should be used when a request is made which does not correspond to an existing file.
    } */

    storage_account_share_properties = null /* {
      cors_enabled = true #(optional) Should cross origin resource sharing be enabled.
      cors_rule = {
        allowed_headers    = ["*"]                                   #(Required) A list of headers that are allowed to be a part of the cross-origin request.
        allowed_methods    = ["GET", "HEAD", "MERGE", "POST", "PUT"] #(Required) A list of HTTP methods that are allowed to be executed by the origin. Valid options are DELETE, GET, HEAD, MERGE, POST, OPTIONS, PUT or PATCH.
        allowed_origins    = ["*"]                                   #(Required) A list of origin domains that will be allowed by CORS.
        exposed_headers    = ["*"]                                   #(Required) A list of response headers that are exposed to CORS clients.
        max_age_in_seconds = 60                                      #(Required) The number of seconds the client should cache a preflight response.
      }

      retention_policy = {
        retention_policy_days = 7 #(Optional) Specifies the number of days that the azurerm_storage_share should be retained, between 1 and 365 days. Defaults to 7.
      }

      smb = {
        smb_versions                        = ["SMB2.1"]      #(Optional) A set of SMB protocol versions. Possible values are SMB2.1, SMB3.0, and SMB3.1.1.
        smb_authentication_types            = ["NTLMv2"]      #(Optional) A set of SMB authentication methods. Possible values are NTLMv2, and Kerberos.
        smb_kerberos_ticket_encryption_type = ["RC4-HMAC"]    #(Optional) A set of Kerberos ticket encryption. Possible values are RC4-HMAC, and AES-256.
        smb_channel_encryption_type         = ["AES-128-CCM"] #(Optional) A set of SMB channel encryption. Possible values are AES-128-CCM, AES-128-GCM, and AES-256-GCM.
        smb_multichannel_enabled            = false           #(Optional) Indicates whether multichannel is enabled. Defaults to false. This is only supported on Premium storage accounts.
      }
    } */

    storage_account_network_rules = null
    # storage_account_network_rules = {
    #   default_action = "Deny"                 #(Required) Specifies the default action of allow or deny when no other rules match. Valid options are Deny or Allow.
    #   bypass         = ["Logging", "Metrics"] #(Optional) Specifies whether traffic is bypassed for Logging/Metrics/AzureServices. Valid options are any combination of Logging, Metrics, AzureServices, or None.
    #   ip_rules       = ["40.87.5.111"]        #(Optional) List of public IP or IP ranges in CIDR Format. Only IPv4 addresses are allowed. Private IP address ranges (as defined in RFC 1918) are not allowed.

    #   storage_account_network_rules_vnet_subnets = [{
    #     storage_account_network_rules_virtual_network_name = "ploceusvnet000001"                   #(Required) Vitural Network name to be associated.
    #     storage_account_network_rules_subnet_name          = "ploceussubnet000001"                 #(Required) Subnet Name to be associated.
    #     storage_account_network_rules_vnet_subscription_id = "xxxxxxx-xxxxxxx-xxxxxxxxx-xxxxxxxxx" #(Required) Subscription Id where Vnet is created.
    #     storage_account_network_rules_vnet_rg_name         = "ploceusrg000001"                     #(Required) Resource group where Vnet is created.
    #     },
    #     {
    #       storage_account_network_rules_virtual_network_name = "ploceusvnet000001"                   #(Required) Vitural Network name to be associated.
    #       storage_account_network_rules_subnet_name          = "ploceussubnet000002"                 #(Required) Subnet Name to be associated.
    #       storage_account_network_rules_vnet_subscription_id = "xxxxxxx-xxxxxxx-xxxxxxxxx-xxxxxxxxx" #(Required) Subscription Id where Vnet is created.
    #       storage_account_network_rules_vnet_rg_name         = "ploceusrg000001"                     #(Required) Resource group where Vnet is created.
    #   }]

    #   private_link_access =  {
    #     "private_link_access_01" = {
    #       endpoint_resource_id = "/subscriptions/XXXXXXXXXXXXXXXXXXXXXXX/resourceGroups/XXXXXXXXXXXXXXXXXXXX/providers/Microsoft.Sql/servers/XXXXXXXXXXXXXXXXXXXX"
    #       endpoint_tenant_id   = "xxxxxxxxx-xxxxxxxxx-xxxxxxxxxx-xxxxxxxxx"
    #     }
    #   }
    # }

    storage_account_azure_files_authentication = null
    # storage_account_azure_files_authentication = {  # Use this block when need to authenticate with Azure active directory domain services or Active Directory.
    #   directory_type = "AADDS" #(Required) Specifies the directory service used. Possible values are AADDS and AD.
    #   active_directory = {
    #     storage_sid         = "xxxxxxxxxx" #(Required) Specifies the security identifier (SID) for Azure Storage.
    #     domain_name         = "www.ploceus1.com" #(Required) Specifies the primary domain that the AD DNS server is authoritative for.
    #     domain_sid          = "xxxxxxxxxx" #(Required) Specifies the security identifier (SID).
    #     domain_guid         = "xxxxxxxxxx" #(Required) Specifies the domain GUID.
    #     forest_name         = "xxxxxxxxxx" #(Required) Specifies the Active Directory forest.
    #     netbios_domain_name = "www.ploceus2.com" #(Required) Specifies the NetBIOS domain name.
    #   }
    # }

    storage_account_routing = {
      publish_internet_endpoints  = false             #(Optional) Should internet routing storage endpoints be published? Defaults to false.
      publish_microsoft_endpoints = false             #(Optional) Should Microsoft routing storage endpoints be published? Defaults to false.
      choice                      = "InternetRouting" #(Optional) Specifies the kind of network routing opted by the user. Possible values are InternetRouting and MicrosoftRouting. Defaults to MicrosoftRouting.
    }

    storage_account_immutability_policy = null /* {
      allow_protected_append_writes = false      #(Required) When enabled, new blocks can be written to an append blob while maintaining immutability protection and compliance. Only new blocks can be added and any existing blocks cannot be modified or deleted.
      state                         = "Disabled" #(Required) Defines the mode of the policy. Disabled state disables the policy, Unlocked state allows increase and decrease of immutability retention time and also allows toggling allowProtectedAppendWrites property, Locked state only allows the increase of the immutability retention time. A policy can only be created in a Disabled or Unlocked state and can be toggled between the two states. Only a policy in an Unlocked state can transition to a Locked state which cannot be reverted.
      period_since_creation_in_days = 7          #(Required) The immutability period for the blobs in the container since the policy creation, in days.
    } */

    storage_account_sas_policy = {
      expiration_period = "11:12:13:14" #(Required) The SAS expiration period in format of DD.HH:MM:SS.
      expiration_action = "Log"         #(Optional) The SAS expiration action. The only possible value is Log at this moment. Defaults to Log.
    }

    storage_account_tags = { #(Optional) A mapping of tags to assign to the resource.
      Created_By = "Ploceus"
      Department = "CIS"
    }

  }
}

#STORAGE CONTAINER
storage_container_variables = {
  "storage_container" = {
    storage_container_name                  = "ploceusstrcon000001" #Required The name of the Container which should be created within the Storage Account.
    storage_container_storage_account_name  = "ploceusstracc000001" #Required The name of the Storage Account where the Container should be created.
    storage_container_container_access_type = "container"           #Optional The Access Level configured for this Container. Possible values are blob, container or private. Defaults to private.
    storage_container_metadata              = null                  #Optional A mapping of MetaData for this Container. All metadata keys should be lowercase.
  }
}

#WINDOWS FUNCTION APP 
windows_function_app_variables = {
  "windows_function_app_01" = {
    windows_function_app_service_plan_name                = "ploceusappplan000001" #(Required) The name of the App Service Plan within which to create this Function App.
    windows_function_app_service_plan_resource_group_name = "ploceusrg000001"      #(Required) The resource group name of the App Service Plan within which to create this Function App.

    windows_function_app_storage_account_name                = "ploceusstracc000001" #(Optional) The backend storage account name which will be used by this Function App.
    windows_function_app_storage_account_resource_group_name = "ploceusrg000001"     #(Optional) The backend storage account resource group name which will be used by this Function App.
    windows_function_app_storage_container_name              = "ploceusstrcon000001" #(optional) The name of the Storage Container required in the concatenation string for fetching strorage account sas url to the container in backup block .

    windows_function_app_regional_vnet_integration_enabled   = true                  #Set this to true if you want windows function app to be integrated with regional virtual network.
    windows_function_app_subnet_name                         = "ploceussubnet000001" #(Optional) The subnet name which will be used by this Function App for regional virtual network integration.
    windows_function_app_virtual_network_name                = "ploceusvnet000001"   #(Optional) The virtual network name containing subnet which will be used by this Function App for regional virtual network integration.
    windows_function_app_virtual_network_resource_group_name = "ploceusrg000001"     #(Optional) The virtual network resource grooup name containing subnet which will be used by this Function App for regional virtual network integration.

    windows_function_app_key_vault_user_assigned_identity_enabled             = false                   #Should user assigned identity for key_vault be enabled to access key_vault secrets. This identity must also be present in windows_function_app_identity block. 
    windows_function_app_key_vault_user_assigned_identity_name                = "ploceusuai000002"      #The key_vault User Assigned Identity name used for accessing KeyVault secrets. The identity must be assigned to the application in the identity block.
    windows_function_app_key_vault_user_assigned_identity_resource_group_name = "ploceusrg000001"       #The key_vault User Assigned Identity resource group name used for accessing KeyVault secrets. The identity must be assigned to the application in the identity block.
    windows_function_app_key_vault_name                                       = "ploceuskeyvault000001" #The key vault name.
    windows_function_app_key_vault_resource_group_name                        = "ploceusrg000001"       #The key vault resource group name.

    windows_function_app_api_management_api_name            = null #(Optional) The name of the API Management API.
    windows_function_app_api_management_name                = null #(Optional) The name of the API Management Service in which the API Management API exists.
    windows_function_app_api_management_resource_group_name = null #(Optional) The Name of the Resource Group in which the API Management Service exists.
    windows_function_app_api_management_api_revision        = null #(Optional) The Revision of the API Management API.

    windows_function_app_application_insights_enabled             = true              #(Optional) Should Application insights for windows function app be enabled ?
    windows_function_app_application_insights_name                = "ploceusai000001" #(Optional) The Application insights name for linking the windows Function App to Application Insights.
    windows_function_app_application_insights_resource_group_name = "ploceusrg000001" #(Optional) The Application insights resource group name for linking the windows Function App to Application Insights.

    windows_function_app_ip_restriction_subnet_name                         = null # This value is required if in windows_function_app_site config in ip_restriction_block , the value for "ip_restriction_virtual_network_subnet_id_enabled" is set to true.
    windows_function_app_ip_restriction_virtual_network_name                = null # This value is required if in windows_function_app_site config in ip_restriction_block , the value for "ip_restriction_virtual_network_subnet_id_enabled" is set to true.
    windows_function_app_ip_restriction_virtual_network_resource_group_name = null # This value is required if in windows_function_app_site config in ip_restriction_block , the value for "ip_restriction_virtual_network_subnet_id_enabled" is set to true.

    windows_function_app_scm_ip_restriction_subnet_name                         = null # This value is required if in windows_function_app_site config in ip_restriction_block , the value for "ip_restriction_virtual_network_subnet_id_enabled" is set to true.
    windows_function_app_scm_ip_restriction_virtual_network_name                = null # This value is required if in windows_function_app_site config in ip_restriction_block , the value for "ip_restriction_virtual_network_subnet_id_enabled" is set to true.
    windows_function_app_scm_ip_restriction_virtual_network_resource_group_name = null # This value is required if in windows_function_app_site config in ip_restriction_block , the value for "ip_restriction_virtual_network_subnet_id_enabled" is set to true.


    windows_function_app_location                           = "eastus"           #(Required) The Azure Region where the windows Function App should exist.
    windows_function_app_name                               = "ploceuswfa000001" #(Required) The name which should be used for this windows Function App.Limit the function name to 32 characters to avoid naming collisions. 
    windows_function_app_resource_group_name                = "ploceusrg000001"  #(Required) The name of the Resource Group where the windows Function App should exist. 
    windows_function_app_builtin_logging_enabled            = true               #(Optional) Should built in logging be enabled. Configures AzureWebJobsDashboard app setting based on the configured storage setting.
    windows_function_app_client_certificate_enabled         = false              #(Optional) Should the function app use Client Certificates.
    windows_function_app_client_certificate_mode            = "Required"         #(Optional) The mode of the Function App's client certificates requirement for incoming requests. Possible values are Required, Optional, and OptionalInteractiveUser.
    windows_function_app_client_certificate_exclusion_paths = "xxxx;yyyy"        #(Optional) Paths to exclude when using client certificates, separated by ;
    windows_function_app_daily_memory_time_quota            = 0                  #(Optional) The amount of memory in gigabyte-seconds that your application is allowed to consume per day. Setting this value only affects function apps under the consumption plan. Defaults to 0.
    ## NOTE :- consumption plan for app_service_plan can be set only for these SKUs :- Consumption SKUs (Y1, EP1, EP2, and EP3).
    windows_function_app_enabled                       = true  #(Optional) Is the Function App enabled?
    windows_function_app_content_share_force_disabled  = true  #(Optional) Should the settings for linking the Function App to storage be suppressed.
    windows_function_app_functions_extension_version   = "~4"  #(Optional) The runtime version associated with the Function App. Defaults to ~4.
    windows_function_app_https_only                    = false #(Optional) Can the Function App only be accessed via HTTPS? Defaults to false.
    windows_function_app_storage_uses_managed_identity = null  #(Optional) Should the Function App use Managed Identity to access the storage account. Conflicts with storage_account_access_key.
    ##NOTE:- One of storage_account_access_key or storage_uses_managed_identity must be specified when using storage_account_name.

    ## NOTE:- you can pass these values inside the app_settings block as :- 
    ## NOTE:- you can get more app_settings reference for Azure Functions from https://learn.microsoft.com/en-gb/azure/azure-functions/functions-app-settings
    windows_function_app_app_settings = {         #(Optional) A map of key-value pairs for App Settings and custom values.
      AZURE_FUNCTIONS_ENVIRONMENT = "Developemnt" #Only the values of Development, Staging, and Production are honored by the runtime. Default is Production
      # AzureWebJobsDashboard                                = "DefaultEndpointsProtocol=https;AccountName=ploceussa0000981" # Provide suitable values by visiting the http link in NOTE above.
      AzureWebJobsDisableHomepage = false # true means disable the default landing page that is shown for the root URL of a function app. Default is false.
      # AzureWebJobsStorage                                  = "DefaultEndpointsProtocol=https;AccountName=ploceussa0000981" # Provide suitable values by visiting the http link in NOTE above.
      FUNCTIONS_EXTENSION_VERSION                          = "~3"      # Provide suitable values by visiting the http link in NOTE above.
      FUNCTIONS_WORKER_RUNTIME                             = "dotnet"  # Provide suitable values by visiting the http link in NOTE above. DO NOT USE this attribute if you are setting the value for "application_stack_enabled" to true in site_config block.
      FUNCTIONS_WORKER_SHARED_MEMORY_DATA_TRANSFER_ENABLED = "1"       # Provide suitable values by visiting the http link in NOTE above.
      DOCKER_SHM_SIZE                                      = 268435456 # Provide suitable values by visiting the http link in NOTE above.
      # WEBSITE_CONTENTAZUREFILECONNECTIONSTRING             = "DefaultEndpointsProtocol=https;AccountName=ploceussa0000981" # Provide suitable values by visiting the http link in NOTE above.
      # WEBSITE_CONTENTSHARE                                 = "functionapp091999e2"                                        # Provide suitable values by visiting the http link in NOTE above.
    }

    windows_function_app_auth_settings_enabled = false
    windows_function_app_auth_settings = {
      auth_settings_enabled                        = false                  #(Required) Should the Authentication / Authorization feature be enabled for the windows Web App?
      auth_settings_additional_login_parameters    = null                   #(Optional) Specifies a map of login Parameters to send to the OpenID Connect authorization endpoint when a user logs in.
      auth_settings_allowed_external_redirect_urls = null                   #(Optional) Specifies a list of External URLs that can be redirected to as part of logging in or logging out of the windows Web App.
      configure_multiple_auth_providers            = true                   # Should Multiple Authentication providers be configured ?
      auth_settings_default_provider               = "AzureActiveDirectory" #(Optional) The default authentication provider to use when multiple providers are configured. Possible values include: AzureActiveDirectory, Facebook, Google, MicrosoftAccount, Twitter, Github
      auth_settings_runtime_version                = null                   #(Optional) The RuntimeVersion of the Authentication / Authorization feature in use for the windows Web App.
      auth_settings_token_refresh_extension_hours  = 72                     # (Optional) The number of hours after session token expiration that a session token can be used to call the token refresh API. Defaults to 72 hours.
      auth_settings_token_store_enabled            = false                  #Optional) Should the windows Web App durably store platform-specific security tokens that are obtained during login flows? Defaults to false.
      auth_settings_unauthenticated_client_action  = "RedirectToLoginPage"  #Optional) The action to take when an unauthenticated client attempts to access the app. Possible values include: RedirectToLoginPage, AllowAnonymous.
      auth_settings_issuer                         = null                   #(Optional) The OpenID Connect Issuer URI that represents the entity which issues access tokens for this windows Web App.

      active_directory = {
        enabled                                              = true                      #(Required) should active directory authentication be enabled ?
        active_directory_client_id                           = "xxxxxxxxxxxxxxxxxxxx"    #(Required) The ID of the Client to use to authenticate with Azure Active Directory.
        active_directory_client_secret_key_vault_secret_name = "ploceuskvsecretad000001" #(Optional) The Key vault Secret key name for active directory authentication. 
        active_directory_client_secret_setting_name          = null                      #(Optional) The App Setting name that contains the client secret of the Client. Cannot be used with client_secret.
        active_directory_allowed_audiences                   = ["xxx", "yyy", "zzz"]     #(Optional) Specifies a list of Allowed audience values to consider when validating JWTs issued by Azure Active Directory.
      }
      facebook = {
        enabled                                   = true                      #(Required) should facebook authentication be enabled ?
        facebook_app_id                           = "yyyyyyyyyyyyyyyyyyyyyy"  #(Required) The App ID of the Facebook app used for login.
        facebook_app_secret_key_vault_secret_name = "ploceuskvsecretfb000001" #(Optional) The Key vault Secret key name for facebook authentication.
        facebook_app_secret_setting_name          = null                      #(Optional) The app setting name that contains the app_secret value used for Facebook login. Cannot be specified with app_secret.
        facebook_oauth_scopes                     = null                      #(Optional) Specifies a list of OAuth 2.0 scopes to be requested as part of Facebook login authentication.
      }
      github = {
        enabled                                    = false #(Required) should github authentication be enabled ?
        github_client_id                           = null  # (Required) The ID of the GitHub app used for login.
        github_client_secret_key_vault_secret_name = null  #(Optional) The Key vault Secret key name for facebook authentication.
        github_client_secret_setting_name          = null  #(Optional) The app setting name that contains the client_secret value used for GitHub login. Cannot be specified with client_secret.
        github_oauth_scopes                        = null  #(Optional) Specifies a list of OAuth 2.0 scopes that will be requested as part of GitHub login authentication.
      }
      google = {
        enabled                                    = false #(Required) should google authentication be enabled ?
        google_client_id                           = null  # (Required) The ID of the google app used for login.
        google_client_secret_key_vault_secret_name = null  #(Optional) The Key vault Secret key name for facebook authentication.
        google_client_secret_setting_name          = null  #(Optional) The app setting name that contains the client_secret value used for google login. Cannot be specified with client_secret.
        google_oauth_scopes                        = null  #(Optional) Specifies a list of OAuth 2.0 scopes that will be requested as part of Google Sign-In authentication. If not specified, openid, profile, and email are used as default scopes.
      }
      microsoft = {
        enabled                                       = false #(Required) should google authentication be enabled ?
        microsoft_client_id                           = null  # (Required) The ID of the microsoft app used for login.
        microsoft_client_secret_key_vault_secret_name = null  #(Optional) The Key vault Secret key name for facebook authentication.
        microsoft_client_secret_setting_name          = null  #(Optional) The app setting name that contains the client_secret value used for microsoft login. Cannot be specified with client_secret.
        microsoft_oauth_scopes                        = null  #(Optional) Specifies a list of OAuth 2.0 scopes that will be requested as part of Microsoft Account authentication. If not specified, wl.basic is used as the default scope.
      }
      twitter = {
        enabled                                       = false #(Required) should twitter authentication be enabled ?
        twitter_consumer_key_key_vault_secret_name    = null  #(Required) The OAuth 1.0a consumer key of the Twitter application used for sign-in. This will be twitter consumer key name as present in key vault, the value will be fetached from key vault.
        twitter_consumer_secret_key_vault_secret_name = null  #(Optional) The Key vault Secret key name for twitter authentication.
        twitter_consumer_secret_setting_name          = null  #(Optional) The app setting name that contains the OAuth 1.0a consumer secret of the Twitter application used for sign-in. Cannot be specified with consumer_secret.
      }
    }

    windows_function_app_backup = {
      backup_enabled = true                 #(Optional) Should this backup job be enabled?
      backup_name    = "winfunappbackup001" #(Required) The name which should be used for this Backup.
      backup_schedule = {
        backup_schedule_frequency_interval       = 7                      #(Required) How often the backup should be executed (e.g. for weekly backup, this should be set to 7 and frequency_unit should be set to Day).
        backup_schedule_frequency_unit           = "Day"                  #(Required) The unit of time for how often the backup should take place. Possible values include: Day and Hour.
        backup_schedule_keep_at_least_one_backup = false                  #(Optional) Should the service keep at least one backup, regardless of age of backup. Defaults to false.
        backup_schedule_retention_period_days    = 30                     #(Optional) After how many days backups should be deleted.
        backup_schedule_start_time               = "2023-01-01T02:07:14Z" #(Optional) When the schedule should start working in RFC-3339 format.
      }
    }

    windows_function_app_connection_string = null /* {
      "connection_string_01" = {
        connection_string_name                        = "mysqlconnectionstring"      #(Required) The name which should be used for this Connection.
        connection_string_type                        = "MySql"                      #(Required) Type of database. Possible values include: MySQL, SQLServer, SQLAzure, Custom, NotificationHub, ServiceBus, EventHub, APIHub, DocDb, RedisCache, and PostgreSQL.
        connection_string_value_key_vault_secret_name = "ploceuskvsecretmysql000001" #(Required) The Key vault secret name containing value for each connection string type.
      }
    } */

    windows_function_app_identity = {
      windows_function_app_identity_type              = "SystemAssigned" # Possible values could be "UserAssigned", "SystemAssigned", "SystemAssigned, UserAssigned"
      windows_function_app_user_assigned_identity_ids = null /* [{ #This is required when type is set to UserAssigned or SystemAssigned, UserAssigned.
        identity_name                = "ploceusuai000002"
        identity_resource_group_name = "ploceusrg000001"
      }] */
    }

    windows_function_app_storage_account = null /* {
      "storage_account_01" = {
        storage_account_name       = "wfastorage00001" #(Required) The name which should be used for this Storage Account.
        storage_account_name       = "wfastorage00001" #(Required) The name which should be used for this Storage Account.
        storage_account_share_name = "wfastorageshare00001" #(Required) The Name of the File Share or Container Name for Blob storage.
        storage_account_type       = "AzureFiles" #(Required) The Azure Storage Type. Possible values include AzureFiles.
        storage_account_mount_path = null #(Optional) The path at which to mount the storage share.
      }
    } */

    windows_function_app_sticky_settings = null /* {
      sticky_app_setting_names       = list(string) #(Optional) A list of app_setting names that the windows Function App will not swap between Slots when a swap operation is triggered.
      sticky_connection_string_names = list(string) #(Optional) A list of connection_string names that the windows Function App will not swap between Slots when a swap operation is triggered.
    } */

    windows_function_app_site_config = {                                   #(Required) A site_config block as defined below
      site_config_always_on                         = true                 #(Optional) If this windows Web App is Always On enabled. Defaults to false.
      site_config_api_definition_url                = null                 #(Optional) The URL of the API definition that describes this windows Function App.
      site_config_api_management_enabled            = false                #(Optional) Should API Management be enabled for this windows Function App.
      site_config_app_command_line                  = null                 #(Optional) The App command line to launch.
      site_config_app_scale_limit                   = null                 #(Optional) The number of workers this function app can scale out to. Only applicable to apps on the Consumption and Premium plan.
      site_config_default_documents                 = null                 #(Optional) Specifies a list of Default Documents for the windows Web App.
      site_config_elastic_instance_minimum          = null                 #(Optional) The number of minimum instances for this windows Function App. Only affects apps on Elastic Premium plans.
      site_config_ftps_state                        = "Disabled"           #(Optional) State of FTP / FTPS service for this function app. Possible values include: AllAllowed, FtpsOnly and Disabled. Defaults to Disabled.
      site_config_health_check_path                 = null                 #(Optional) The path to be checked for this function app health.
      site_config_health_check_eviction_time_in_min = 2                    #(Optional) The amount of time in minutes that a node can be unhealthy before being removed from the load balancer. Possible values are between 2 and 10. Only valid in conjunction with health_check_path.
      site_config_http2_enabled                     = false                #(Optional) Specifies if the HTTP2 protocol should be enabled. Defaults to false.
      site_config_load_balancing_mode               = "WeightedRoundRobin" #(Optional) The Site load balancing mode. Possible values include: WeightedRoundRobin, LeastRequests, LeastResponseTime, WeightedTotalTraffic, RequestHash, PerSiteRoundRobin. Defaults to LeastRequests if omitted.
      site_config_managed_pipeline_mode             = "Integrated"         #(Optional) Managed pipeline mode. Possible values include: Integrated, Classic. Defaults to Integrated.
      site_config_minimum_tls_version               = "1.2"                #(Optional) The configures the minimum version of TLS required for SSL requests. Possible values include: 1.0, 1.1, and 1.2. Defaults to 1.2.
      site_config_pre_warmed_instance_count         = null                 #(Optional) The number of pre-warmed instances for this function app. Only affects apps on an Elastic Premium plan.
      site_config_remote_debugging_enabled          = false                #(Optional) Should Remote Debugging be enabled. Defaults to false.
      site_config_remote_debugging_version          = "VS2019"             #(Optional) The Remote Debugging Version. Possible values include VS2017, VS2019, and VS2022.
      site_config_runtime_scale_monitoring_enabled  = false                # (Optional) Should Scale Monitoring of the Functions Runtime be enabled?
      site_config_scm_minimum_tls_version           = "1.2"                #(Optional) Configures the minimum version of TLS required for SSL requests to the SCM site Possible values include: 1.0, 1.1, and 1.2. Defaults to 1.2.
      site_config_scm_use_main_ip_restriction       = false                #(Optional) Should the windows Function App ip_restriction configuration be used for the SCM also.
      site_config_use_32_bit_worker                 = true                 #(Optional) Should the windows Web App use a 32-bit worker process. Defaults to true.
      site_config_vnet_route_all_enabled            = false                #(Optional) Should all outbound traffic to have NAT Gateways, Network Security Groups and User Defined Routes applied? Defaults to false.
      site_config_websockets_enabled                = false                #(Optional) Should Web Sockets be enabled. Defaults to false.
      site_config_worker_count                      = null                 # (Optional) The number of Workers for this windows Function App.

      application_stack = null /* {                                   ## NOTE:- If this is set, there must not be an application setting FUNCTIONS_WORKER_RUNTIME.
        application_stack_dotnet_version              = "3.1" #(Optional) The version of .NET to use. Possible values include 3.1, 6.0 and 7.0.
        application_stack_use_dotnet_isolated_runtime = false #(Optional) Should the DotNet process use an isolated runtime. Defaults to false.
        application_stack_java_version                = null  #(Optional) The Version of Java to use. Supported versions include 8, 11 & 17 (In-Preview).
        application_stack_node_version                = null  #(Optional) The version of Node to run. Possible values include 12, 14, 16 and 18.
        application_stack_powershell_core_version     = null  #(Optional) The version of PowerShell Core to run. Possible values are 7, and 7.2.
        application_stack_use_custom_runtime          = null  #(Optional) Should the windows Function App use a custom runtime?
      } */

      app_service_logs = null /* {                          ## NOTE:- This block is not supported on Consumption plans.
        app_service_logs_disk_quota_mb         = 50 #(Required) The amount of disk space to use for logs. Valid values are between 25 and 100.
        app_service_logs_retention_period_days = 90 #(Optional) The retention period for logs in days. Valid values are between 0 and 99999. Defaults to 0 (never delete).
      } */

      site_config_cors_enabled = false
      cors = {
        cors_allowed_origins     = ["xxxx", "yyyy"] #(Required) Specifies a list of origins that should be allowed to make cross-origin calls.
        cors_support_credentials = false            #(Optional) Are credentials allowed in CORS requests? Defaults to false.
      }

      ip_restriction_enabled = false
      ip_restriction = {
        "ip_restriction_01" = {                                                    ## NOTE:- One and only one of ip_address, service_tag or virtual_network_subnet_id must be specified.
          ip_restriction_action                            = "Allow"               #(Optional) The action to take. Possible values are Allow or Deny.
          ip_restriction_ip_address                        = "10.0.4.0/24"         #(Optional) The CIDR notation of the IP or IP Range to match. For example: 10.0.0.0/24 or 192.168.10.1/32
          ip_restriction_name                              = "ploceusiprest000001" #(Optional) The name which should be used for this ip_restriction.
          ip_restriction_priority                          = "100"                 #(Optional) The priority value of this ip_restriction.
          ip_restriction_service_tag                       = null                  #(Optional) The Service Tag used for this IP Restriction.
          ip_restriction_virtual_network_subnet_id_enabled = false

          headers = {
            ip_restriction_headers_x_azure_fdid      = null #(Optional) Specifies a list of Azure Front Door IDs.
            ip_restriction_headers_x_fd_health_probe = null #(Optional) Specifies if a Front Door Health Probe should be expected.
            ip_restriction_headers_x_forwarded_for   = null #(Optional) Specifies a list of addresses for which matching should be applied. Omitting this value means allow any.
            ip_restriction_headers_x_forwarded_host  = null #(Optional) Specifies a list of Hosts for which matching should be applied.
          }
        }
      }

      scm_ip_restriction_enabled = false
      scm_ip_restriction = {
        "scm_ip_restriction_01" = {
          scm_ip_restriction_action                            = "Allow"                  #(Optional) The action to take. Possible values are Allow or Deny.
          scm_ip_restriction_ip_address                        = "10.0.4.0/24"            #(Optional) The CIDR notation of the IP or IP Range to match. For example: 10.0.0.0/24 or 192.168.10.1/32
          scm_ip_restriction_name                              = "ploceusscmiprest000001" #(Optional) The name which should be used for this ip_restriction.
          scm_ip_restriction_priority                          = "110"                    #(Optional) The priority value of this ip_restriction.
          scm_ip_restriction_service_tag                       = null                     #(Optional) The Service Tag used for this IP Restriction.
          scm_ip_restriction_virtual_network_subnet_id_enabled = false

          headers = {
            scm_ip_restriction_headers_x_azure_fdid      = null #(Optional) Specifies a list of Azure Front Door IDs.
            scm_ip_restriction_headers_x_fd_health_probe = null #(Optional) Specifies if a Front Door Health Probe should be expected.
            scm_ip_restriction_headers_x_forwarded_for   = null #(Optional) Specifies a list of addresses for which matching should be applied. Omitting this value means allow any.
            scm_ip_restriction_headers_x_forwarded_host  = null #(Optional) Specifies a list of Hosts for which matching should be applied.
          }
        }
      }
    }

    windows_function_app_tags = { #(Optional) A mapping of tags which should be assigned to the Windows Function App.
      Created_By = "Ploceus"
      Department = "CIS"
    }
  }
}

function_app_subscription_id           = "xxxxxxxx-xxxxxxxx-xxxxxxxxxx-xxxxxxxxxx"
function_app_tenant_id                 = "xxxxxxxx-xxxxxxxx-xxxxxxxxxx-xxxxxxxxx"
application_insights_subscription_id   = "xxxxxxxx-xxxxxxxx-xxxxxxxxxx-xxxxxxxxxx"
application_insights_tenant_id         = "xxxxxxxx-xxxxxxxx-xxxxxxxxxx-xxxxxxxxx"
log_analytics_subscription_id          = "xxxxxxxx-xxxxxxxx-xxxxxxxxxx-xxxxxxxxxx"
log_analytics_tenant_id                = "xxxxxxxx-xxxxxxxx-xxxxxxxxxx-xxxxxxxxx"
api_management_subscription_id         = "xxxxxxxx-xxxxxxxx-xxxxxxxxxx-xxxxxxxxxx"
api_management_tenant_id               = "xxxxxxxx-xxxxxxxx-xxxxxxxxxx-xxxxxxxxx"
key_vault_subscription_id              = "xxxxxxxx-xxxxxxxx-xxxxxxxxxx-xxxxxxxxxx"
key_vault_tenant_id                    = "xxxxxxxx-xxxxxxxx-xxxxxxxxxx-xxxxxxxxx"
virtual_network_subscription_id        = "xxxxxxxx-xxxxxxxx-xxxxxxxxxx-xxxxxxxxxx"
virtual_network_tenant_id              = "xxxxxxxx-xxxxxxxx-xxxxxxxxxx-xxxxxxxxx"
storage_account_subscription_id        = "xxxxxxxx-xxxxxxxx-xxxxxxxxxx-xxxxxxxxxx"
storage_account_tenant_id              = "xxxxxxxx-xxxxxxxx-xxxxxxxxxx-xxxxxxxxx"
user_assigned_identity_subscription_id = "xxxxxxxx-xxxxxxxx-xxxxxxxxxx-xxxxxxxxxx"
user_assigned_identity_tenant_id       = "xxxxxxxx-xxxxxxxx-xxxxxxxxxx-xxxxxxxxx"