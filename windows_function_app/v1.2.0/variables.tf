variable "windows_function_app_variables" {
  description = "map of object of windows function app variables"
  default     = {}
  type = map(object({
    windows_function_app_service_plan_name                = string #(Required) The name of the App Service Plan within which to create this Function App.
    windows_function_app_service_plan_resource_group_name = string #(Required) The resource group name of the App Service Plan within which to create this Function App.

    windows_function_app_storage_account_name                = string #(Optional) The backend storage account name which will be used by this Function App.
    windows_function_app_storage_account_resource_group_name = string #(Optional) The backend storage account resource group name which will be used by this Function App.
    windows_function_app_storage_container_name              = string #(optional) The name of the Storage Container required in the concatenation string for fetching strorage account sas url to the container in backup block .

    windows_function_app_regional_vnet_integration_enabled   = bool   ##Should user assigned identity for key_vault be enabled to access key_vault secrets. This identity must also be present in linux_function_app_identity block. 
    windows_function_app_subnet_name                         = string #(Optional) The subnet name which will be used by this Function App for regional virtual network integration.
    windows_function_app_virtual_network_name                = string #(Optional) The virtual network name containing subnet which will be used by this Function App for regional virtual network integration.
    windows_function_app_virtual_network_resource_group_name = string #(Optional) The virtual network resource grooup name containing subnet which will be used by this Function App for regional virtual network integration.

    windows_function_app_key_vault_user_assigned_identity_enabled             = bool
    windows_function_app_key_vault_user_assigned_identity_name                = string #The key_vault User Assigned Identity name used for accessing KeyVault secrets. The identity must be assigned to the application in the identity block.
    windows_function_app_key_vault_user_assigned_identity_resource_group_name = string #The key_vault User Assigned Identity resource group name used for accessing KeyVault secrets. The identity must be assigned to the application in the identity block.
    windows_function_app_key_vault_name                                       = string #The key vault name.
    windows_function_app_key_vault_resource_group_name                        = string #The key vault resource group name.

    windows_function_app_api_management_api_name            = string #(Optional) The name of the API Management API.
    windows_function_app_api_management_name                = string #(Optional) The name of the API Management Service in which the API Management API exists.
    windows_function_app_api_management_resource_group_name = string #(Optional) The Name of the Resource Group in which the API Management Service exists.
    windows_function_app_api_management_api_revision        = string #(Optional) The Revision of the API Management API.

    windows_function_app_application_insights_enabled             = bool   #(Optional) Should Application insights for windows function app be enabled ?
    windows_function_app_application_insights_name                = string #(Optional) The Application insights name for linking the windows Function App to Application Insights.
    windows_function_app_application_insights_resource_group_name = string #(Optional) The Application insights resource group name for linking the windows Function App to Application Insights.

    windows_function_app_ip_restriction_subnet_name                         = string
    windows_function_app_ip_restriction_virtual_network_name                = string
    windows_function_app_ip_restriction_virtual_network_resource_group_name = string

    windows_function_app_scm_ip_restriction_subnet_name                         = string
    windows_function_app_scm_ip_restriction_virtual_network_name                = string
    windows_function_app_scm_ip_restriction_virtual_network_resource_group_name = string


    windows_function_app_location                           = string #(Required) The Azure Region where the windows Function App should exist.
    windows_function_app_name                               = string #(Required) The name which should be used for this windows Function App.Limit the function name to 32 characters to avoid naming collisions. 
    windows_function_app_resource_group_name                = string #(Required) The name of the Resource Group where the windows Function App should exist. 
    windows_function_app_builtin_logging_enabled            = bool   #(Optional) Should built in logging be enabled. Configures AzureWebJobsDashboard app setting based on the configured storage setting.
    windows_function_app_client_certificate_enabled         = bool   #(Optional) Should the function app use Client Certificates.
    windows_function_app_client_certificate_mode            = string #(Optional) The mode of the Function App's client certificates requirement for incoming requests. Possible values are Required, Optional, and OptionalInteractiveUser.
    windows_function_app_client_certificate_exclusion_paths = string #(Optional) Paths to exclude when using client certificates, separated by ;
    windows_function_app_daily_memory_time_quota            = number #(Optional) The amount of memory in gigabyte-seconds that your application is allowed to consume per day. Setting this value only affects function apps under the consumption plan. Defaults to 0.
    ## NOTE :- consumption plan for app_service_plan can be set only for these SKUs :- Consumption SKUs (Y1, EP1, EP2, and EP3).
    windows_function_app_enabled                       = bool   #(Optional) Is the Function App enabled?
    windows_function_app_content_share_force_disabled  = bool   #(Optional) Should the settings for linking the Function App to storage be suppressed.
    windows_function_app_functions_extension_version   = string #(Optional) The runtime version associated with the Function App. Defaults to ~4.
    windows_function_app_https_only                    = bool   #(Optional) Can the Function App only be accessed via HTTPS? Defaults to false.
    windows_function_app_storage_uses_managed_identity = bool   #(Optional) Should the Function App use Managed Identity to access the storage account. Conflicts with storage_account_access_key.
    ##NOTE:- One of storage_account_access_key or storage_uses_managed_identity must be specified when using storage_account_name.

    windows_function_app_app_settings = map(any) #(Optional) A map of key-value pairs for App Settings and custom values.

    windows_function_app_auth_settings_enabled = bool
    windows_function_app_auth_settings = object({
      auth_settings_enabled                        = bool         #(Required) Should the Authentication / Authorization feature be enabled for the windows Web App?
      auth_settings_additional_login_parameters    = map(any)     #(Optional) Specifies a map of login Parameters to send to the OpenID Connect authorization endpoint when a user logs in.
      auth_settings_allowed_external_redirect_urls = list(string) #(Optional) Specifies a list of External URLs that can be redirected to as part of logging in or logging out of the windows Web App.
      configure_multiple_auth_providers            = bool         # Should Multiple Authentication providers be configured ?
      auth_settings_default_provider               = string       #(Optional) The default authentication provider to use when multiple providers are configured. Possible values include: AzureActiveDirectory, Facebook, Google, MicrosoftAccount, Twitter, Github
      auth_settings_runtime_version                = string       #(Optional) The RuntimeVersion of the Authentication / Authorization feature in use for the windows Web App.
      auth_settings_token_refresh_extension_hours  = number       # (Optional) The number of hours after session token expiration that a session token can be used to call the token refresh API. Defaults to 72 hours.
      auth_settings_token_store_enabled            = bool         #Optional) Should the windows Web App durably store platform-specific security tokens that are obtained during login flows? Defaults to false.
      auth_settings_unauthenticated_client_action  = string       #Optional) The action to take when an unauthenticated client attempts to access the app. Possible values include: RedirectToLoginPage, AllowAnonymous.
      auth_settings_issuer                         = string       #(Optional) The OpenID Connect Issuer URI that represents the entity which issues access tokens for this windows Web App.

      active_directory = object({
        enabled                                              = bool         #(Required) should active directory authentication be enabled ?
        active_directory_client_id                           = string       #(Required) The ID of the Client to use to authenticate with Azure Active Directory.
        active_directory_client_secret_key_vault_secret_name = string       #(Optional) The Key vault Secret key name for active directory authentication. 
        active_directory_client_secret_setting_name          = string       #(Optional) The App Setting name that contains the client secret of the Client. Cannot be used with client_secret.
        active_directory_allowed_audiences                   = list(string) #(Optional) Specifies a list of Allowed audience values to consider when validating JWTs issued by Azure Active Directory.
      })
      facebook = object({
        enabled                                   = bool         #(Required) should facebook authentication be enabled ?
        facebook_app_id                           = string       #(Required) The App ID of the Facebook app used for login.
        facebook_app_secret_key_vault_secret_name = string       #(Optional) The Key vault Secret key name for facebook authentication.
        facebook_app_secret_setting_name          = string       #(Optional) The app setting name that contains the app_secret value used for Facebook login. Cannot be specified with app_secret.
        facebook_oauth_scopes                     = list(string) #(Optional) Specifies a list of OAuth 2.0 scopes to be requested as part of Facebook login authentication.
      })
      github = object({
        enabled                                    = bool         #(Required) should github authentication be enabled ?
        github_client_id                           = string       # (Required) The ID of the GitHub app used for login.
        github_client_secret_key_vault_secret_name = string       #(Optional) The Key vault Secret key name for facebook authentication.
        github_client_secret_setting_name          = string       #(Optional) The app setting name that contains the client_secret value used for GitHub login. Cannot be specified with client_secret.
        github_oauth_scopes                        = list(string) #(Optional) Specifies a list of OAuth 2.0 scopes that will be requested as part of GitHub login authentication.
      })
      google = object({
        enabled                                    = bool         #(Required) should google authentication be enabled ?
        google_client_id                           = string       # (Required) The ID of the google app used for login.
        google_client_secret_key_vault_secret_name = string       #(Optional) The Key vault Secret key name for facebook authentication.
        google_client_secret_setting_name          = string       #(Optional) The app setting name that contains the client_secret value used for google login. Cannot be specified with client_secret.
        google_oauth_scopes                        = list(string) #(Optional) Specifies a list of OAuth 2.0 scopes that will be requested as part of Google Sign-In authentication. If not specified, openid, profile, and email are used as default scopes.
      })
      microsoft = object({
        enabled                                       = bool         #(Required) should google authentication be enabled ?
        microsoft_client_id                           = string       # (Required) The ID of the microsoft app used for login.
        microsoft_client_secret_key_vault_secret_name = string       #(Optional) The Key vault Secret key name for facebook authentication.
        microsoft_client_secret_setting_name          = string       #(Optional) The app setting name that contains the client_secret value used for microsoft login. Cannot be specified with client_secret.
        microsoft_oauth_scopes                        = list(string) #(Optional) Specifies a list of OAuth 2.0 scopes that will be requested as part of Microsoft Account authentication. If not specified, wl.basic is used as the default scope.
      })
      twitter = object({
        enabled                                       = bool   #(Required) should twitter authentication be enabled ?
        twitter_consumer_key_key_vault_secret_name    = string #(Required) The OAuth 1.0a consumer key of the Twitter application used for sign-in.
        twitter_consumer_secret_key_vault_secret_name = string #(Optional) The Key vault Secret key name for twitter authentication.
        twitter_consumer_secret_setting_name          = string #(Optional) The app setting name that contains the OAuth 1.0a consumer secret of the Twitter application used for sign-in. Cannot be specified with consumer_secret.
      })
    })

    windows_function_app_backup = object({
      backup_enabled = bool   #(Optional) Should this backup job be enabled?
      backup_name    = string #(Required) The name which should be used for this Backup.
      backup_schedule = object({
        backup_schedule_frequency_interval       = number #(Required) How often the backup should be executed (e.g. for weekly backup, this should be set to 7 and frequency_unit should be set to Day).
        backup_schedule_frequency_unit           = string #(Required) The unit of time for how often the backup should take place. Possible values include: Day and Hour.
        backup_schedule_keep_at_least_one_backup = bool   #(Optional) Should the service keep at least one backup, regardless of age of backup. Defaults to false.
        backup_schedule_retention_period_days    = number #(Optional) After how many days backups should be deleted.
        backup_schedule_start_time               = string #(Optional) When the schedule should start working in RFC-3339 format.
      })
    })

    windows_function_app_connection_string = map(object({
      connection_string_name                        = string #(Required) The name which should be used for this Connection.
      connection_string_type                        = string #(Required) Type of database. Possible values include: MySQL, SQLServer, SQLAzure, Custom, NotificationHub, ServiceBus, EventHub, APIHub, DocDb, RedisCache, and PostgreSQL.
      connection_string_value_key_vault_secret_name = string #(Required) The Key vault secret name containing value for each connection string type.
    }))

    windows_function_app_identity = object({
      windows_function_app_identity_type = string                     # Possible values could be "UserAssigned", "SystemAssigned", "SystemAssigned, UserAssigned"
      windows_function_app_user_assigned_identity_ids = list(object({ #This is required when type is set to UserAssigned or SystemAssigned, UserAssigned.
        identity_name                = string
        identity_resource_group_name = string
      }))
    })

    windows_function_app_storage_account = map(object({
      storage_account_name       = string #(Required) The name which should be used for this Storage Account.
      storage_account_share_name = string #(Required) The Name of the File Share or Container Name for Blob storage.
      storage_account_type       = string #(Required) The Azure Storage Type. Possible values include AzureFiles.
      storage_account_mount_path = string #(Optional) The path at which to mount the storage share.
    }))

    windows_function_app_sticky_settings = object({
      sticky_app_setting_names       = list(string) #(Optional) A list of app_setting names that the windows Function App will not swap between Slots when a swap operation is triggered.
      sticky_connection_string_names = list(string) #(Optional) A list of connection_string names that the windows Function App will not swap between Slots when a swap operation is triggered.
    })

    windows_function_app_site_config = object({                    #(Required) A site_config block as defined below
      site_config_always_on                         = bool         #(Optional) If this windows Web App is Always On enabled. Defaults to false.
      site_config_api_definition_url                = string       #(Optional) The URL of the API definition that describes this windows Function App.
      site_config_api_management_enabled            = bool         #(Optional) Should API Management be enabled for this windows Function App.
      site_config_app_command_line                  = string       #(Optional) The App command line to launch.
      site_config_app_scale_limit                   = number       #(Optional) The number of workers this function app can scale out to. Only applicable to apps on the Consumption and Premium plan.
      site_config_default_documents                 = list(string) #(Optional) Specifies a list of Default Documents for the windows Web App.
      site_config_elastic_instance_minimum          = number       #(Optional) The number of minimum instances for this windows Function App. Only affects apps on Elastic Premium plans.
      site_config_ftps_state                        = string       #(Optional) State of FTP / FTPS service for this function app. Possible values include: AllAllowed, FtpsOnly and Disabled. Defaults to Disabled.
      site_config_health_check_path                 = string       #(Optional) The path to be checked for this function app health.
      site_config_health_check_eviction_time_in_min = number       #(Optional) The amount of time in minutes that a node can be unhealthy before being removed from the load balancer. Possible values are between 2 and 10. Only valid in conjunction with health_check_path.
      site_config_http2_enabled                     = bool         #(Optional) Specifies if the HTTP2 protocol should be enabled. Defaults to false.
      site_config_load_balancing_mode               = string       #(Optional) The Site load balancing mode. Possible values include: WeightedRoundRobin, LeastRequests, LeastResponseTime, WeightedTotalTraffic, RequestHash, PerSiteRoundRobin. Defaults to LeastRequests if omitted.
      site_config_managed_pipeline_mode             = string       #(Optional) Managed pipeline mode. Possible values include: Integrated, Classic. Defaults to Integrated.
      site_config_minimum_tls_version               = string       #(Optional) The configures the minimum version of TLS required for SSL requests. Possible values include: 1.0, 1.1, and 1.2. Defaults to 1.2.
      site_config_pre_warmed_instance_count         = number       #(Optional) The number of pre-warmed instances for this function app. Only affects apps on an Elastic Premium plan.
      site_config_remote_debugging_enabled          = bool         #(Optional) Should Remote Debugging be enabled. Defaults to false.
      site_config_remote_debugging_version          = string       #(Optional) The Remote Debugging Version. Possible values include VS2017, VS2019, and VS2022.
      site_config_runtime_scale_monitoring_enabled  = bool         # (Optional) Should Scale Monitoring of the Functions Runtime be enabled?
      site_config_scm_minimum_tls_version           = string       #(Optional) Configures the minimum version of TLS required for SSL requests to the SCM site Possible values include: 1.0, 1.1, and 1.2. Defaults to 1.2.
      site_config_scm_use_main_ip_restriction       = bool         #(Optional) Should the windows Function App ip_restriction configuration be used for the SCM also.
      site_config_use_32_bit_worker                 = bool         #(Optional) Should the windows Web App use a 32-bit worker process. Defaults to true.
      site_config_vnet_route_all_enabled            = bool         #(Optional) Should all outbound traffic to have NAT Gateways, Network Security Groups and User Defined Routes applied? Defaults to false.
      site_config_websockets_enabled                = bool         #(Optional) Should Web Sockets be enabled. Defaults to false.
      site_config_worker_count                      = number       # (Optional) The number of Workers for this windows Function App.

      application_stack = object({                             ## NOTE:- If this is set, there must not be an application setting FUNCTIONS_WORKER_RUNTIME.
        application_stack_dotnet_version              = string #(Optional) The version of .NET to use. Possible values include 3.1, 6.0 and 7.0.
        application_stack_use_dotnet_isolated_runtime = bool   #(Optional) Should the DotNet process use an isolated runtime. Defaults to false.
        application_stack_java_version                = number #(Optional) The Version of Java to use. Supported versions include 8, 11 & 17 (In-Preview).
        application_stack_node_version                = number #(Optional) The version of Node to run. Possible values include 12, 14, 16 and 18.
        application_stack_powershell_core_version     = string #(Optional) The version of PowerShell Core to run. Possible values are 7, and 7.2.
        application_stack_use_custom_runtime          = bool   #(Optional) Should the windows Function App use a custom runtime?
      })

      app_service_logs = object({                       ## NOTE:- This block is not supported on Consumption plans.
        app_service_logs_disk_quota_mb         = number #(Required) The amount of disk space to use for logs. Valid values are between 25 and 100.
        app_service_logs_retention_period_days = number #(Optional) The retention period for logs in days. Valid values are between 0 and 99999. Defaults to 0 (never delete).
      })

      site_config_cors_enabled = bool
      cors = object({
        cors_allowed_origins     = list(string) #(Required) Specifies a list of origins that should be allowed to make cross-origin calls.
        cors_support_credentials = bool         #(Optional) Are credentials allowed in CORS requests? Defaults to false.
      })

      ip_restriction_enabled = bool
      ip_restriction = map(object({                               ## NOTE:- One and only one of ip_address, service_tag or virtual_network_subnet_id must be specified.
        ip_restriction_action                            = string #(Optional) The action to take. Possible values are Allow or Deny.
        ip_restriction_ip_address                        = string #(Optional) The CIDR notation of the IP or IP Range to match. For example: 10.0.0.0/24 or 192.168.10.1/32
        ip_restriction_name                              = string #(Optional) The name which should be used for this ip_restriction.
        ip_restriction_priority                          = string #(Optional) The priority value of this ip_restriction.
        ip_restriction_service_tag                       = string #(Optional) The Service Tag used for this IP Restriction.
        ip_restriction_virtual_network_subnet_id_enabled = bool

        headers = object({
          ip_restriction_headers_x_azure_fdid      = list(string) #(Optional) Specifies a list of Azure Front Door IDs.
          ip_restriction_headers_x_fd_health_probe = list(string) #(Optional) Specifies if a Front Door Health Probe should be expected.
          ip_restriction_headers_x_forwarded_for   = list(string) #(Optional) Specifies a list of addresses for which matching should be applied. Omitting this value means allow any.
          ip_restriction_headers_x_forwarded_host  = list(string) #(Optional) Specifies a list of Hosts for which matching should be applied.
        })
      }))

      scm_ip_restriction_enabled = bool
      scm_ip_restriction = map(object({
        scm_ip_restriction_action                            = string #(Optional) The action to take. Possible values are Allow or Deny.
        scm_ip_restriction_ip_address                        = string #(Optional) The CIDR notation of the IP or IP Range to match. For example: 10.0.0.0/24 or 192.168.10.1/32
        scm_ip_restriction_name                              = string #(Optional) The name which should be used for this ip_restriction.
        scm_ip_restriction_priority                          = string #(Optional) The priority value of this ip_restriction.
        scm_ip_restriction_service_tag                       = string #(Optional) The Service Tag used for this IP Restriction.
        scm_ip_restriction_virtual_network_subnet_id_enabled = bool

        headers = object({
          scm_ip_restriction_headers_x_azure_fdid      = list(string) #(Optional) Specifies a list of Azure Front Door IDs.
          scm_ip_restriction_headers_x_fd_health_probe = list(string) #(Optional) Specifies if a Front Door Health Probe should be expected.
          scm_ip_restriction_headers_x_forwarded_for   = list(string) #(Optional) Specifies a list of addresses for which matching should be applied. Omitting this value means allow any.
          scm_ip_restriction_headers_x_forwarded_host  = list(string) #(Optional) Specifies a list of Hosts for which matching should be applied.
        })
      }))
    })

    windows_function_app_tags = map(string) #(Optional) A mapping of tags which should be assigned to the windows Function App.
  }))
}