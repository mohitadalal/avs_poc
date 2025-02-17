#WINDOWS WEB APP
windows_web_app_variables = {
  "windows_web_app_1" = {
    windows_web_app_name                                 = "pncpocwebapp01" #(Required) The name which should be used for this Windows Web App. Changing this forces a new Windows Web App to be created.
    windows_web_app_location                             = "eastus2"        #(Required) The Azure Region where the Windows Web App should exist. Changing this forces a new Windows Web App to be created.
    windows_web_app_resource_group_name                  = "PNC-POC-RG"     #(Required) The name of the Resource Group where the Windows Web App should exist. Changing this forces a new Windows Web App to be created.
    windows_web_app_app_service_plan_name                = "pncpocasp001"   #(Required) The App service plan name. This is required for fetching service_plan_id.
    windows_web_app_app_service_plan_resource_group_name = "PNC-POC-RG"     #(Required) The App service plan RG name. This is required for fetching service_plan_id.
    windows_web_app_client_affinity_enabled              = false            #(Optional) Should Client Affinity be enabled?
    windows_web_app_client_certificate_enabled           = false            # (Optional) Should Client Certificates be enabled?
    windows_web_app_client_certificate_mode              = null             #(Optional) The Client Certificate mode. Possible values are Required, Optional, and OptionalInteractiveUser. This property has no effect when client_cert_enabled is false
    windows_web_app_client_certificate_exclusion_paths   = null             #(Optional) Paths to exclude when using client certificates, separated by ;
    windows_web_app_app_settings = {                                        #(Optional) A map of key-value pairs for App Settings and custom values.
      AZURE_FUNCTIONS_ENVIRONMENT                          = "Developemnt"  #Only the values of Development, Staging, and Production are honored by the runtime. Default is Production
      AzureWebJobsDisableHomepage                          = false          # true means disable the default landing page that is shown for the root URL of a function app. Default is false.
      FUNCTIONS_EXTENSION_VERSION                          = "~4"           # Provide suitable values by visiting the http link in NOTE above.
      FUNCTIONS_WORKER_RUNTIME                             = "dotnet"       # Provide suitable values by visiting the http link in NOTE above. DO NOT USE this attribute if you are setting the value for "application_stack_enabled" to true in site_config block.
      FUNCTIONS_WORKER_SHARED_MEMORY_DATA_TRANSFER_ENABLED = "1"            # Provide suitable values by visiting the http link in NOTE above.
      DOCKER_SHM_SIZE                                      = 268435456      # Provide suitable values by visiting the http link in NOTE above.                          # Provide suitable values by visiting the http link in NOTE above.
    }
    windows_web_app_application_insights_enabled                     = false #(Optional) Should the Application Insights be enabled for the webapp
    windows_web_app_application_insights_name                        = null  #(Optional) The name of the Application Insights if enabled
    windows_web_app_application_insights_resource_group_name         = null  #(Optional) The name of the Resource group of the Application Insights if enabled
    windows_web_app_enabled                                          = true  #(Optional) Should the Windows Web App be enabled? Defaults to true.
    windows_web_app_https_only                                       = true  #(Optional) Should the Windows Web App require HTTPS connections.
    windows_web_app_public_network_access_enabled                    = true  #(Optional) Should public network access be enabled for the Web App. Defaults to true.
    windows_web_app_zip_deploy_file                                  = null  #(Optional) The local path and filename of the Zip packaged application to deploy to this Windows Web App.
    windows_web_app_key_vault_reference_identity_id_required         = false #(Optional) To set virtual_network_subnet_id, make this value as true. If key_vault_reference_identity_id parameter is required or no.
    windows_web_app_is_regional_virtual_network_integration_required = false #The AzureRM Terraform provider provides regional virtual network integration via the standalone resource app_service_virtual_network_swift_connection and in-line within this resource using the virtual_network_subnet_id property. You cannot use both methods simultaneously. If the virtual network is set via the resource app_service_virtual_network_swift_connection then ignore_changes should be used in the web app configuration. Assigning the virtual_network_subnet_id property requires RBAC permissions on the subnet.
    windows_web_app_sticky_settings                                  = null  #(Optional) A sticky_settings block as defined below.
    windows_web_app_connection_string                                = null  #(Optional) One or more connection_string blocks as defined below.
    windows_web_app_storage_account                                  = null
    windows_web_app_identity = {                                  #(Optional) An identity block as defined below.
      windows_web_app_identity_type            = "SystemAssigned" #(Required) Specifies the type of Managed Service Identity that should be configured on this Windows Web App. Possible values are SystemAssigned, UserAssigned, SystemAssigned, UserAssigned (to enable both).
      windows_web_app_user_assigned_identities = null
      # [{            #(Optional) A list of User Assigned Managed Identity IDs to be assigned to this Windows Web App. This is required when type is set to UserAssigned or SystemAssigned, UserAssigned.
      #   user_identity_name                = "ploceusuai000001" #(Required) The user assigned identity name. This is required for fetching identity_ids.
      #   user_identity_resource_group_name = "ploceusrg000001"  #(Required) The user assigned identity RG name. This is required for fetching identity_ids.
      # }]
    }
    windows_web_app_auth_settings = {                      #(Optional) An auth_settings block as defined below.
      auth_settings_enabled                        = false #(Required) Should the Authentication / Authorization feature is enabled for the Windows Web App be enabled?
      auth_settings_additional_login_parameters    = null  #(Optional) Specifies a map of login Parameters to send to the OpenID Connect authorization endpoint when a user logs in.
      auth_settings_allowed_external_redirect_urls = null  #(Optional) Specifies a list of External URLs that can be redirected to as part of logging in or logging out of the Windows Web App.
      auth_settings_unauthenticated_client_action  = null  #(Optional) The action to take when an unauthenticated client attempts to access the app. Possible values include: RedirectToLoginPage, AllowAnonymous.
      auth_settings_default_provider               = null  #(Optional) The default authentication provider to use when multiple providers are configured. Possible values include: AzureActiveDirectory, Facebook, Google, MicrosoftAccount, Twitter, Github. This setting is only needed if multiple providers are configured, and the unauthenticated_client_action is set to "RedirectToLoginPage".
      auth_settings_issuer                         = null  #(Optional) The OpenID Connect Issuer URI that represents the entity which issues access tokens for this Windows Web App. When using Azure Active Directory, this value is the URI of the directory tenant, e.g. https://sts.windows.net/{tenant-guid}/.
      auth_settings_runtime_version                = null  #(Optional) The RuntimeVersion of the Authentication / Authorization feature in use for the Windows Web App.
      auth_settings_token_refresh_extension_hours  = null  #(Optional) The number of hours after session token expiration that a session token can be used to call the token refresh API. Defaults to 72 hours.
      auth_settings_token_store_enabled            = false #(Optional) Should the Windows Web App durably store platform-specific security tokens that are obtained during login flows? Defaults to false.
      windows_web_app_ad_secret_required           = false # make it false if auth_settings_active_directory=null
      auth_settings_active_directory               = null  #(Optional) An active_directory block as defined below.
      /*{                                                                                   
        active_directory_client_id                  = "xxxxx-xxxxx-xxxxx-xxxxx-xxxxx"                                            #(Required) The ID of the Client to use to authenticate with Azure Active Directory.
        active_directory_client_secret              = "ploceusadsecret000001"                                              #(Optional) The Client Secret for the Client ID. Cannot be used with client_secret_setting_name.
        active_directory_allowed_audiences          = ["ploceusallowedaudiences0000001", "ploceusallowedaudiences0000002"] #(Optional) Specifies a list of Allowed audience values to consider when validating JWTs issued by Azure Active Directory.The client_id value is always considered an allowed audience.
        active_directory_client_secret_setting_name = null                                                                 #(Optional) The App Setting name that contains the client secret of the Client. Cannot be used with client_secret.
      }*/
      windows_web_app_facebook_secret_required = false # make it false if auth_settings_facebook=null
      auth_settings_facebook                   = null  # (Optional) A facebook block as defined below.
      /*{                       
        facebook_app_id                  = null        #(Required) The App ID of the Facebook app used for login.
        facebook_app_secret              = null        #(Optional) The App Secret of the Facebook app used for Facebook login. Cannot be specified with app_secret_setting_name.
        facebook_oauth_scopes            = null        #(Optional) Specifies a list of OAuth 2.0 scopes to be requested as part of Facebook login authentication.
        facebook_app_secret_setting_name = null        #(Optional) The app setting name that contains the app_secret value used for Facebook login. Cannot be specified with app_secret.
      }*/
      windows_web_app_github_secret_required = false # make it false if auth_settings_github=null
      auth_settings_github                   = null  #(Optional) A github block as defined below.
      /*{                                                                                   
        github_client_id                  = "xxxxx-xxxxx-xxxxx-xxxxx-xxxxx"                                            #(Required) The ID of the GitHub app used for login.
        github_client_secret              = "ploceusgithubsecret000001"                                          #(Optional) The Client Secret of the GitHub app used for GitHub login. Cannot be specified with client_secret_setting_name.
        github_oauth_scopes               = ["ploceusallowedaudiences0000001", "ploceusallowedaudiences0000002"] #(Optional) Specifies a list of OAuth 2.0 scopes that will be requested as part of GitHub login authentication.
        github_client_secret_setting_name = null                                                                 #(Optional) The app setting name that contains the client_secret value used for GitHub login. Cannot be specified with client_secret.
      }*/
      windows_web_app_google_secret_required = false # make it false if auth_settings_google=null
      auth_settings_google                   = null  #(Optional) A google block as defined below.
      /*{                       
        google_client_id                  = null     #(Required) The OpenID Connect Client ID for the Google web application.
        google_client_secret              = null     #(Optional) The client secret associated with the Google web application. Cannot be specified with client_secret_setting_name.
        google_oauth_scopes               = null     #(Optional) Specifies a list of OAuth 2.0 scopes that will be requested as part of Google Sign-In authentication. If not specified, openid, profile, and email are used as default scopes.
        google_client_secret_setting_name = null     #(Optional) The app setting name that contains the client_secret value used for Google login. Cannot be specified with client_secret.
      }*/
      windows_web_app_microsoft_secret_required = false # make it false if auth_settings_microsoft=null
      auth_settings_microsoft                   = null  #(Optional) A microsoft block as defined below.
      /*{                       
        microsoft_client_id                  = null     #(Required) The OAuth 2.0 client ID that was created for the app used for authentication.
        microsoft_client_secret              = null     #(Optional) The OAuth 2.0 client secret that was created for the app used for authentication. Cannot be specified with client_secret_setting_name.
        microsoft_client_secret_setting_name = null     #(Optional) The app setting name containing the OAuth 2.0 client secret that was created for the app used for authentication. Cannot be specified with client_secret.
        microsoft_oauth_scopes               = null     #(Optional) Specifies a list of OAuth 2.0 scopes that will be requested as part of Microsoft Account authentication. If not specified, "wl.basic" is used as the default scope.
      }*/
      windows_web_app_twitter_secret_required = false # make it false if auth_settings_twitter=null
      auth_settings_twitter                   = null  #(Optional) A twitter block as defined below.
      /*{                       
        twitter_consumer_secret              = null   #(Optional) The OAuth 1.0a consumer secret of the Twitter application used for sign-in. Cannot be specified with consumer_secret_setting_name.
        twitter_consumer_key                 = null   #(Required) The OAuth 1.0a consumer key of the Twitter application used for sign-in.
        twitter_consumer_secret_setting_name = null   #(Optional) The app setting name that contains the OAuth 1.0a consumer secret of the Twitter application used for sign-in. Cannot be specified with consumer_secret.
      }*/
    }
    windows_web_app_auth_settings_v2 = null
    windows_web_app_backup           = null
    windows_web_app_logs             = null
    windows_web_app_site_config = {                                           #(Required) A site_config block as defined below.
      site_config_always_on                                      = true       #(Optional) If this Windows Web App is Always On enabled. Defaults to true. always_on must be explicitly set to false when using Free, F1, D1, or Shared Service Plans.
      site_config_ftps_state                                     = "FtpsOnly" #(Optional) The State of FTP / FTPS service. Possible values include: AllAllowed, FtpsOnly, Disabled. Azure defaults this value to AllAllowed, however, in the interests of security Terraform will default this to Disabled to ensure the user makes a conscious choice to enable it.
      site_config_windows_web_app_is_api_management_api_required = false      #(Optional) Should API Management API ID be set under site_config?
      site_config_app_command_line                               = null       #(Optional) The App command line to launch.
      site_config_health_check_path                              = null       #(Optional) The path to the Health Check.
      site_config_health_check_eviction_time_in_min              = null       #(Optional) The amount of time in minutes that a node can be unhealthy before being removed from the load balancer. Possible values are between 2 and 10. Only valid in conjunction with health_check_path.
      site_config_http2_enabled                                  = false      #(Optional) Should the HTTP2 be enabled?
      site_config_auto_heal_enabled                              = false      #(Optional) Should Auto heal rules be enabled. Required with auto_heal_setting.
      site_config_local_mysql_enabled                            = false      #(Optional) Use Local MySQL. Defaults to false.
      site_config_websockets_enabled                             = false      #(Optional) Should Web Sockets be enabled. Defaults to false.
      site_config_vnet_route_all_enabled                         = false      #(Optional) Should all outbound traffic to have NAT Gateways, Network Security Groups and User Defined Routes applied? Defaults to false.
      site_config_scm_minimum_tls_version                        = null       #(Optional) The configures the minimum version of TLS required for SSL requests to the SCM site Possible values include: 1.0, 1.1, and 1.2. Defaults to 1.2.
      site_config_scm_use_main_ip_restriction                    = false      #(Optional) Should the Windows Web App ip_restriction configuration be used for the SCM also.
      site_config_use_32_bit_worker                              = true       #(Optional) Should the Windows Web App use a 32-bit worker.
      site_config_default_documents                              = null       #(Optional) Specifies a list of Default Documents for the Windows Web App.
      site_config_load_balancing_mode                            = null       #(Optional) The Site load balancing. Possible values include: WeightedRoundRobin, LeastRequests, LeastResponseTime, WeightedTotalTraffic, RequestHash, PerSiteRoundRobin. Defaults to LeastRequests if omitted.
      site_config_managed_pipeline_mode                          = null       #(Optional) Managed pipeline mode. Possible values include: Integrated, Classic.
      site_config_minimum_tls_version                            = null       #(Optional) The configures the minimum version of TLS required for SSL requests. Possible values include: 1.0, 1.1, and 1.2. Defaults to 1.2.
      site_config_remote_debugging_enabled                       = false      #(Optional) Should Remote Debugging be enabled. Defaults to false.
      site_config_remote_debugging_version                       = null       #(Optional) The Remote Debugging Version. Possible values include VS2017 and VS2019
      site_config_worker_count                                   = null       #(Optional) The number of Workers for this Windows App Service.
      site_config_container_registry_managed_identity_client_id  = null       #(Optional) The Client ID of the Managed Service Identity to use for connections to the Azure Container Registry.
      site_config_container_registry_use_managed_identity        = false      #(Optional) Should connections for Azure Container Registry use Managed Identity.
      site_config_cors                                           = null       #(Optional) A cors block as defined below.

      site_config_ip_restriction = null #(Optional) One or more ip_restriction blocks as defined below.

      site_config_scm_ip_restriction = null #(Optional) One or more scm_ip_restriction blocks as defined below.
      site_config_application_stack = {
        application_stack_docker_image_name            = "mycontainerimage:latest"       # Replace with your container image
        application_stack_docker_registry_url          = "https://myregistry.azurecr.io" # Replace with your registry URL
        application_stack_docker_registry_username     = "myregistryusername"            # Replace with your registry username
        application_stack_docker_registry_password     = "myregistrypassword"            # Replace with your registry password
        application_stack_dotnet_version               = null                            #(Optional) The version of .NET to use when current_stack is set to dotnet. Possible values include v3.5, v4.0, v4.5, v4.6, v4.7, v4.8, and Off.
        application_stack_dotnet_core_version          = null                            #(Optional) The version of .NET to use when current_stack is set to dotnetcore. Possible values include v4.0.
        application_stack_tomcat_version               = null                            #(Optional) The version of Tomcat the Java App should use. Conflicts with java_embedded_server_enabled
        application_stack_java_embedded_server_enabled = null                            #(Optional) Should the Java Embedded Server (Java SE) be used to run the app.
        application_stack_python                       = null                            #(Optional) Specifies whether this is a Python app. Defaults to false.
        application_stack_java_version                 = null                            #(Optional) The version of Java to use when current_stack is set to java. Possible values include 1.7, 1.8, 11 and 17. Required with java_container and java_container_version.For compatible combinations of java_version, java_container and java_container_version users can use az webapp list-runtimes from command line.
        application_stack_node_version                 = null                            #(Optional) The version of node to use when current_stack is set to node. Possible values include 12-LTS, 14-LTS, and 16-LTS.This property conflicts with java_version.
        application_stack_php_version                  = null                            #(Optional) The version of PHP to use when current_stack is set to php. Possible values are 7.1, 7.4 and Off.
        application_stack_current_stack                = null                            #(Optional) The Application Stack for the Windows Web App. Possible values include dotnet, dotnetcore, node, python, php, and java. Whilst this property is Optional omitting it can cause unexpected behaviour, in particular for display of settings in the Azure Portal.he value of dotnetcore is for use in combination with dotnet_version set to core3.1 only.
      }
      site_config_virtual_application = null #(Optional) One or more virtual_application blocks as defined below.
      site_config_auto_heal_setting   = null #(Optional) A auto_heal_setting block as defined below. Required with auto_heal.
    }
    windows_web_app_subnet_required                        = false         #(Required) Whether subnet is required or not.
    windows_web_app_virtual_network_name                   = null          #(Optional) If windows_web_app_subnet_required = true, specify the Virtual Network name. This is required to fetch Subnet ID.
    windows_web_app_subnet_name                            = null          #(Optional) If windows_web_app_subnet_required = true, specify the Subnet name. This is required to fetch Subnet ID.
    windows_web_app_subnet_resource_group_name             = null          #(Optional) If windows_web_app_subnet_required = true, specify the Subnet RG name. This is required to fetch Subnet ID.
    windows_web_app_key_vault_name                         = null          #(Optional) The Key vault name. Required for fetching key_vault_id.
    windows_web_app_key_vault_resource_group_name          = null          #(Optional) The Key vault RG name. Required for fetching key_vault_id.
    windows_web_app_storage_account_required               = false         #(Required) Whether storage account is required or not.
    windows_web_app_storage_account_name                   = null          #(Optional) If windows_web_app_storage_account_required = true, specify the Storage Account name. This is required to fetch Subnet ID.
    windows_web_app_storage_container_name                 = null          ##(Optional) The Storage Account Container name. This is required if logs settings needs to be set.
    windows_web_app_storage_account_resource_group_name    = null          #(Optional) If windows_web_app_storage_account_required = true, specify the Storage Account RG name. This is required to fetch Subnet ID.
    windows_web_app_storage_account_sas_start_time         = null          #(Optional) If windows_web_app_storage_account_required = true, specify the Storage Account SAS Start Time. This is required to fetch Subnet ID.
    windows_web_app_storage_account_sas_end_time           = null          #(Optional) If windows_web_app_storage_account_required = true, specify the Storage Account SAS End Time. This is required to fetch Subnet ID.
    windows_web_app_api_management_api_name                = null          #(Optional) If site_config_is_api_management_api_id_required = true, specify the API Management API name.
    windows_web_app_api_management_name                    = null          #(Optional) If site_config_is_api_management_api_id_required = true, specify the API Management name.
    windows_web_app_api_management_resource_group_name     = null          #(Optional) If site_config_is_api_management_api_id_required = true, specify the API Management RG name.
    windows_web_app_api_management_revision                = null          #(Optional) If site_config_is_api_management_api_id_required = true, specify the revision of API Management API.
    windows_web_app_container_registry_name                = "pncpocacr01" #(Optional) If site_config_container_registry_managed_identity_client_id = true, specify the Container Registry name.
    windows_web_app_container_registry_resource_group_name = "PNC-POC-RG"  #(Optional) If site_config_container_registry_managed_identity_client_id = true, specify the Container Registry RG name.
    windows_web_app_tags = {
      Owner       = "gowtham.nara@neudesic.com",
      Environment = "POC",
    } #(Optional) A mapping of tags which should be assigned to the Windows Web App.
  }
}