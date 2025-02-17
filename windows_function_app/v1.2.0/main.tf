locals {
  connection_string_value = flatten([for k, v in var.windows_function_app_variables : [
    for x, y in v.windows_function_app_connection_string :
    merge({ main_key = k, connection_string_key = x }, y)
  ] if v.windows_function_app_connection_string != null])

  identities = { for k, v in var.windows_function_app_variables : k => lookup(v, "windows_function_app_identity", null) != null ? v.windows_function_app_identity.windows_function_app_identity_type != "SystemAssigned" ? v.windows_function_app_identity.windows_function_app_user_assigned_identity_ids : null : null }
  identities_list = flatten([
    for k, v in local.identities : [for i in v : [
      {
        main_key                     = k
        identity_name                = i.identity_name
        identity_resource_group_name = i.identity_resource_group_name
    }]] if v != null
  ])

}

locals {
  ip_configuration_details = flatten([for k, v in var.windows_function_app_variables :
    [for i, j in v.windows_function_app_site_config.ip_restriction :
      merge({
        main_key   = k,
        nested_key = i
    }, j) if v.windows_function_app_site_config.ip_restriction_enabled != false && j.ip_restriction_virtual_network_subnet_id_enabled != false]
  ])

  ip_configuration_scm_details = flatten([for k, v in var.windows_function_app_variables :
    [for i, j in v.windows_function_app_site_config.scm_ip_restriction :
      merge({
        main_key   = k,
        nested_key = i
    }, j) if v.windows_function_app_site_config.scm_ip_restriction_enabled != false && j.scm_ip_restriction_virtual_network_subnet_id_enabled != false]
  ])
}

data "azurerm_client_config" "current" {
  provider = azurerm.function_app_sub
}

data "azurerm_key_vault_secret" "connection_string_value" {
  provider     = azurerm.key_vault_sub
  for_each     = { for i in local.connection_string_value : "${i.main_key},${i.connection_string_key}" => i }
  name         = each.value.connection_string_value_key_vault_secret_name
  key_vault_id = data.azurerm_key_vault.key_vault[each.value.main_key].id
}

data "azurerm_user_assigned_identity" "user_assigned_identities" {
  provider            = azurerm.user_assigned_identity_sub
  for_each            = { for v in local.identities_list : "${v.main_key},${v.identity_name}" => v }
  name                = each.value.identity_name
  resource_group_name = each.value.identity_resource_group_name
}

data "azurerm_user_assigned_identity" "key_vault_user_assigned_identity" {
  provider            = azurerm.user_assigned_identity_sub
  for_each            = { for k, v in var.windows_function_app_variables : k => v if lookup(v, "windows_function_app_key_vault_user_assigned_identity_enabled", false) == true }
  name                = each.value.windows_function_app_key_vault_user_assigned_identity_name
  resource_group_name = each.value.windows_function_app_key_vault_user_assigned_identity_resource_group_name
}

data "azurerm_storage_account" "storage_account" {
  provider            = azurerm.storage_account_sub
  for_each            = var.windows_function_app_variables
  name                = each.value.windows_function_app_storage_account_name
  resource_group_name = each.value.windows_function_app_storage_account_resource_group_name
}

data "azurerm_service_plan" "service_plan" {
  provider            = azurerm.function_app_sub
  for_each            = var.windows_function_app_variables
  name                = each.value.windows_function_app_service_plan_name
  resource_group_name = each.value.windows_function_app_service_plan_resource_group_name
}

data "azurerm_subnet" "subnet" {
  provider             = azurerm.virtual_network_sub
  for_each             = { for k, v in var.windows_function_app_variables : k => v if lookup(v, "windows_function_app_regional_vnet_integration_enabled", false) == true }
  name                 = each.value.windows_function_app_subnet_name
  virtual_network_name = each.value.windows_function_app_virtual_network_name
  resource_group_name  = each.value.windows_function_app_virtual_network_resource_group_name
}

data "azurerm_key_vault" "key_vault" {
  provider            = azurerm.key_vault_sub
  for_each            = { for k, v in var.windows_function_app_variables : k => v if lookup(v, "windows_function_app_key_vault_name", null) != null }
  name                = each.value.windows_function_app_key_vault_name
  resource_group_name = each.value.windows_function_app_key_vault_resource_group_name
}

data "azurerm_key_vault_secret" "AD_client_secret" {
  provider     = azurerm.key_vault_sub
  for_each     = { for k, v in var.windows_function_app_variables : k => v if lookup(v, "windows_function_app_auth_settings_enabled", false) == true && v.windows_function_app_auth_settings.active_directory.enabled == true }
  name         = each.value.windows_function_app_auth_settings.active_directory.active_directory_client_secret_key_vault_secret_name
  key_vault_id = data.azurerm_key_vault.key_vault[each.key].id
}

data "azurerm_key_vault_secret" "facebook_secret" {
  provider     = azurerm.key_vault_sub
  for_each     = { for k, v in var.windows_function_app_variables : k => v if(lookup(v, "windows_function_app_auth_settings_enabled", false) == true && v.windows_function_app_auth_settings.facebook.enabled == true) }
  name         = each.value.windows_function_app_auth_settings.facebook.facebook_app_secret_key_vault_secret_name
  key_vault_id = data.azurerm_key_vault.key_vault[each.key].id
}

data "azurerm_key_vault_secret" "github_secret" {
  provider     = azurerm.key_vault_sub
  for_each     = { for k, v in var.windows_function_app_variables : k => v if(lookup(v, "windows_function_app_auth_settings_enabled", false) == true && v.windows_function_app_auth_settings.github.enabled == true) }
  name         = each.value.windows_function_app_auth_settings.github.github_client_secret_key_vault_secret_name
  key_vault_id = data.azurerm_key_vault.key_vault[each.key].id
}

data "azurerm_key_vault_secret" "google_secret" {
  provider     = azurerm.key_vault_sub
  for_each     = { for k, v in var.windows_function_app_variables : k => v if(lookup(v, "windows_function_app_auth_settings_enabled", false) == true && v.windows_function_app_auth_settings.google.enabled == true) }
  name         = each.value.windows_function_app_auth_settings.google.google_client_secret_key_vault_secret_name
  key_vault_id = data.azurerm_key_vault.key_vault[each.key].id
}

data "azurerm_key_vault_secret" "microsoft_provider_secret" {
  provider     = azurerm.key_vault_sub
  for_each     = { for k, v in var.windows_function_app_variables : k => v if(lookup(v, "windows_function_app_auth_settings_enabled", false) == true && v.windows_function_app_auth_settings.microsoft.enabled == true) }
  name         = each.value.windows_function_app_auth_settings.microsoft.microsoft_client_secret_key_vault_secret_name
  key_vault_id = data.azurerm_key_vault.key_vault[each.key].id
}

data "azurerm_key_vault_secret" "twitter_provider_secret" {
  provider     = azurerm.key_vault_sub
  for_each     = { for k, v in var.windows_function_app_variables : k => v if(lookup(v, "windows_function_app_auth_settings_enabled", false) == true && v.windows_function_app_auth_settings.twitter.enabled == true) }
  name         = each.value.windows_function_app_auth_settings.twitter.twitter_consumer_secret_key_vault_secret_name
  key_vault_id = data.azurerm_key_vault.key_vault[each.key].id
}

data "azurerm_key_vault_secret" "twitter_consumer_key" {
  provider     = azurerm.key_vault_sub
  for_each     = { for k, v in var.windows_function_app_variables : k => v if(lookup(v, "windows_function_app_auth_settings_enabled", false) == true && v.windows_function_app_auth_settings.twitter.enabled == true) }
  name         = each.value.windows_function_app_auth_settings.twitter.twitter_consumer_key_key_vault_secret_name
  key_vault_id = data.azurerm_key_vault.key_vault[each.key].id
}

data "azurerm_storage_account_sas" "storage_account_sas" {
  provider          = azurerm.storage_account_sub
  for_each          = { for k, v in var.windows_function_app_variables : k => v if lookup(v, "windows_function_app_backup") != null }
  connection_string = data.azurerm_storage_account.storage_account[each.key].primary_connection_string
  https_only        = true
  signed_version    = "2017-07-29"
  start             = "2023-01-21T00:00:00Z"
  expiry            = "2024-01-21T00:00:00Z"

  resource_types {
    service   = true
    container = false
    object    = false
  }

  services {
    blob  = true
    queue = false
    table = false
    file  = false
  }


  permissions {
    read    = true
    write   = true
    delete  = false
    list    = false
    add     = true
    create  = true
    update  = false
    process = false
    tag     = false
    filter  = false
  }
}

data "azurerm_api_management_api" "api_management_api" {
  provider            = azurerm.api_management_sub
  for_each            = { for k, v in var.windows_function_app_variables : k => v if lookup(v.windows_function_app_site_config, "site_config_api_management_enabled", false) == true }
  name                = each.value.windows_function_app_api_management_api_name
  api_management_name = each.value.windows_function_app_api_management_name
  resource_group_name = each.value.windows_function_app_api_management_resource_group_name
  revision            = each.value.windows_function_app_api_management_api_revision
}

data "azurerm_application_insights" "application_insights" {
  provider            = azurerm.application_insights_sub
  for_each            = { for k, v in var.windows_function_app_variables : k => v if lookup(v, "windows_function_app_application_insights_enabled", false) == true }
  name                = each.value.windows_function_app_application_insights_name
  resource_group_name = each.value.windows_function_app_application_insights_resource_group_name
}

data "azurerm_subnet" "ip_restriction_subnet" {
  provider             = azurerm.virtual_network_sub
  for_each             = { for i in local.ip_configuration_details : "${i.main_key},${i.nested_key}" => i }
  name                 = each.value.windows_function_app_ip_restriction_subnet_name
  virtual_network_name = each.value.windows_function_app_ip_restriction_virtual_network_name
  resource_group_name  = each.value.windows_function_app_ip_restriction_virtual_network_resource_group_name
}


data "azurerm_subnet" "scm_ip_restriction_subnet" {
  provider             = azurerm.virtual_network_sub
  for_each             = { for i in local.ip_configuration_scm_details : "${i.main_key},${i.nested_key}" => i }
  name                 = each.value.windows_function_app_scm_ip_restriction_subnet_name
  virtual_network_name = each.value.windows_function_app_scm_ip_restriction_virtual_network_name
  resource_group_name  = each.value.windows_function_app_scm_ip_restriction_virtual_network_resource_group_name
}


#windows FUNCTION APP RESOURCE
resource "azurerm_windows_function_app" "windows_function_app" {
  provider                           = azurerm.function_app_sub
  for_each                           = var.windows_function_app_variables
  name                               = each.value.windows_function_app_name
  resource_group_name                = each.value.windows_function_app_resource_group_name
  location                           = each.value.windows_function_app_location
  service_plan_id                    = data.azurerm_service_plan.service_plan[each.key].id
  builtin_logging_enabled            = each.value.windows_function_app_builtin_logging_enabled
  client_certificate_enabled         = each.value.windows_function_app_client_certificate_enabled
  client_certificate_mode            = each.value.windows_function_app_client_certificate_mode
  client_certificate_exclusion_paths = each.value.windows_function_app_client_certificate_exclusion_paths
  daily_memory_time_quota            = each.value.windows_function_app_daily_memory_time_quota
  enabled                            = each.value.windows_function_app_enabled
  content_share_force_disabled       = each.value.windows_function_app_content_share_force_disabled
  functions_extension_version        = each.value.windows_function_app_functions_extension_version
  https_only                         = each.value.windows_function_app_https_only
  key_vault_reference_identity_id    = lookup(each.value, "windows_function_app_key_vault_user_assigned_identity_enabled", false) == true ? data.azurerm_user_assigned_identity.key_vault_user_assigned_identity[each.key].id : null
  storage_account_name               = each.value.windows_function_app_storage_account_name
  storage_account_access_key         = each.value.windows_function_app_storage_uses_managed_identity == true ? null : data.azurerm_storage_account.storage_account[each.key].primary_access_key
  storage_uses_managed_identity      = each.value.windows_function_app_storage_uses_managed_identity
  virtual_network_subnet_id          = each.value.windows_function_app_regional_vnet_integration_enabled == true ? data.azurerm_subnet.subnet[each.key].id : null

  app_settings = each.value.windows_function_app_app_settings == null ? {} : each.value.windows_function_app_app_settings

  dynamic "auth_settings" {
    for_each = each.value.windows_function_app_auth_settings_enabled == false ? [] : [each.value.windows_function_app_auth_settings]
    content {
      enabled                        = auth_settings.value.auth_settings_enabled
      additional_login_parameters    = auth_settings.value.auth_settings_additional_login_parameters
      allowed_external_redirect_urls = auth_settings.value.auth_settings_allowed_external_redirect_urls
      default_provider               = auth_settings.value.configure_multiple_auth_providers == true && auth_settings.value.auth_settings_unauthenticated_client_action == "RedirectToLoginPage" ? auth_settings.value.auth_settings_default_provider : null
      runtime_version                = auth_settings.value.auth_settings_runtime_version
      token_refresh_extension_hours  = auth_settings.value.auth_settings_token_refresh_extension_hours
      token_store_enabled            = auth_settings.value.auth_settings_token_store_enabled
      unauthenticated_client_action  = auth_settings.value.auth_settings_unauthenticated_client_action
      issuer                         = auth_settings.value.auth_settings_issuer

      dynamic "active_directory" {
        for_each = auth_settings.value.active_directory["enabled"] == true ? [auth_settings.value.active_directory] : []
        content {
          client_id                  = active_directory.value.active_directory_client_id
          allowed_audiences          = active_directory.value.active_directory_allowed_audiences
          client_secret              = active_directory.value.active_directory_client_secret_setting_name != null ? null : data.azurerm_key_vault_secret.AD_client_secret[each.key].value
          client_secret_setting_name = active_directory.value.active_directory_client_secret_setting_name == null ? null : active_directory.value.active_directory_client_secret_setting_name
        }
      }
      dynamic "facebook" {
        for_each = auth_settings.value.facebook["enabled"] == true ? [auth_settings.value.facebook] : []
        content {
          app_id                  = facebook.value.facebook_app_id
          app_secret              = facebook.value.facebook_app_secret_setting_name != null ? null : data.azurerm_key_vault_secret.facebook_secret[each.key].value
          app_secret_setting_name = facebook.value.facebook_app_secret_setting_name == null ? null : facebook.value.facebook_app_secret_setting_name
          oauth_scopes            = facebook.value.facebook_oauth_scopes
        }
      }
      dynamic "github" {
        for_each = auth_settings.value.github["enabled"] == true ? [auth_settings.value.github] : []
        content {
          client_id                  = github.value.github_client_id
          client_secret              = github.value.github_client_secret_setting_name != null ? null : data.azurerm_key_vault_secret.facebook_secret[each.key].value
          client_secret_setting_name = github.value.github_client_secret_setting_name == null ? null : github.value.github_client_secret_setting_name
          oauth_scopes               = github.value.github_oauth_scopes
        }
      }
      dynamic "google" {
        for_each = auth_settings.value.google["enabled"] == true ? [auth_settings.value.google] : []
        content {
          client_id                  = google.value.google_client_id
          client_secret              = google.value.google_client_secret_setting_name != null ? null : data.azurerm_key_vault_secret.google_secret[each.key].value
          client_secret_setting_name = google.value.google_client_secret_setting_name == null ? null : google.value.google_client_secret_setting_name
          oauth_scopes               = google.value.google_oauth_scopes
        }
      }
      dynamic "microsoft" {
        for_each = auth_settings.value.microsoft["enabled"] == true ? [auth_settings.value.microsoft] : []
        content {
          client_id                  = microsoft.value.microsoft_client_id
          client_secret              = microsoft.value.microsoft_client_secret_setting_name != null ? null : data.azurerm_key_vault_secret.microsoft_provider_secret[each.key].value
          client_secret_setting_name = microsoft.value.microsoft_client_secret_setting_name == null ? null : microsoft.value.microsoft_client_secret_setting_name
          oauth_scopes               = microsoft.value.microsoft_oauth_scopes
        }
      }
      dynamic "twitter" {
        for_each = auth_settings.value.microsoft["enabled"] == true ? [auth_settings.value.microsoft] : []
        content {
          consumer_key                 = data.azurerm_key_vault_secret.twitter_consumer_key[each.key].value
          consumer_secret              = twitter.value.twitter_consumer_secret_setting_name != null ? null : data.azurerm_key_vault_secret.twitter_provider_secret[each.key].value
          consumer_secret_setting_name = twitter.value.twitter_consumer_secret_setting_name == null ? null : twitter.value.twitter_consumer_secret_setting_name
        }
      }
    }
  }

  dynamic "backup" {
    for_each = each.value.windows_function_app_backup != null ? [each.value.windows_function_app_backup] : []
    content {
      enabled             = backup.value.backup_enabled
      name                = backup.value.backup_name
      storage_account_url = "https://${each.value.windows_function_app_storage_account_name}.blob.core.windows.net/${each.value.windows_function_app_storage_container_name}${data.azurerm_storage_account_sas.storage_account_sas[each.key].sas}&sr=b"
      dynamic "schedule" {
        for_each = [backup.value.backup_schedule]
        content {
          frequency_interval       = schedule.value.backup_schedule_frequency_interval
          frequency_unit           = schedule.value.backup_schedule_frequency_unit
          keep_at_least_one_backup = schedule.value.backup_schedule_keep_at_least_one_backup
          retention_period_days    = schedule.value.backup_schedule_retention_period_days
          start_time               = schedule.value.backup_schedule_start_time
        }
      }
    }
  }

  dynamic "connection_string" {
    for_each = each.value.windows_function_app_connection_string == null ? {} : each.value.windows_function_app_connection_string
    content {
      name  = connection_string.value.connection_string_name
      type  = connection_string.value.connection_string_type
      value = data.azurerm_key_vault_secret.connection_string_value["${each.key},${connection_string.key}"].value
    }
  }

  dynamic "identity" {
    for_each = each.value.windows_function_app_identity != null ? [1] : []
    content {
      type         = each.value.windows_function_app_identity.windows_function_app_identity_type
      identity_ids = each.value.windows_function_app_identity.windows_function_app_user_assigned_identity_ids == null ? [] : [for k, v in each.value.windows_function_app_identity.windows_function_app_user_assigned_identity_ids : data.azurerm_user_assigned_identity.user_assigned_identities["${each.key},${v.identity_name}"].id]
    }
  }

  dynamic "storage_account" {
    for_each = each.value.windows_function_app_storage_account == null ? {} : each.value.windows_function_app_storage_account
    content {
      access_key   = data.azurerm_storage_account.storage_account[each.key].primary_access_key
      account_name = storage_account.value.storage_account_name
      name         = storage_account.value.storage_account_name
      share_name   = storage_account.value.storage_account_share_name
      type         = storage_account.value.storage_account_type
      mount_path   = storage_account.value.storage_account_mount_path
    }
  }

  dynamic "sticky_settings" {
    for_each = each.value.windows_function_app_sticky_settings == null ? [] : [each.value.windows_function_app_sticky_settings]
    content {
      app_setting_names       = sticky_settings.value.sticky_app_setting_names
      connection_string_names = sticky_settings.value.sticky_connection_string_names
    }
  }

  dynamic "site_config" {
    for_each = each.value.windows_function_app_site_config == [] ? [] : [each.value.windows_function_app_site_config]
    content {
      always_on                              = site_config.value.site_config_always_on
      api_definition_url                     = site_config.value.site_config_api_definition_url
      api_management_api_id                  = site_config.value.site_config_api_management_enabled == true ? data.azurerm_api_management_api.api_management_api[each.key].id : null
      app_command_line                       = site_config.value.site_config_app_command_line
      app_scale_limit                        = site_config.value.site_config_app_scale_limit
      application_insights_connection_string = each.value.windows_function_app_application_insights_enabled == true ? data.azurerm_application_insights.application_insights[each.key].connection_string : null
      application_insights_key               = each.value.windows_function_app_application_insights_enabled == true ? data.azurerm_application_insights.application_insights[each.key].instrumentation_key : null
      default_documents                      = site_config.value.site_config_default_documents
      elastic_instance_minimum               = site_config.value.site_config_elastic_instance_minimum
      ftps_state                             = site_config.value.site_config_ftps_state
      health_check_path                      = site_config.value.site_config_health_check_path
      health_check_eviction_time_in_min      = site_config.value.site_config_health_check_eviction_time_in_min
      http2_enabled                          = site_config.value.site_config_http2_enabled
      load_balancing_mode                    = site_config.value.site_config_load_balancing_mode
      managed_pipeline_mode                  = site_config.value.site_config_managed_pipeline_mode
      minimum_tls_version                    = site_config.value.site_config_minimum_tls_version
      pre_warmed_instance_count              = site_config.value.site_config_pre_warmed_instance_count
      remote_debugging_enabled               = site_config.value.site_config_remote_debugging_enabled
      remote_debugging_version               = site_config.value.site_config_remote_debugging_version
      runtime_scale_monitoring_enabled       = site_config.value.site_config_runtime_scale_monitoring_enabled
      scm_minimum_tls_version                = site_config.value.site_config_scm_minimum_tls_version
      scm_use_main_ip_restriction            = site_config.value.site_config_scm_use_main_ip_restriction
      use_32_bit_worker                      = site_config.value.site_config_use_32_bit_worker
      vnet_route_all_enabled                 = site_config.value.site_config_vnet_route_all_enabled
      websockets_enabled                     = site_config.value.site_config_websockets_enabled
      worker_count                           = site_config.value.site_config_worker_count

      dynamic "application_stack" {
        for_each = site_config.value.application_stack == null ? [] : [site_config.value.application_stack]
        content {
          dotnet_version              = application_stack.value.application_stack_dotnet_version
          use_dotnet_isolated_runtime = application_stack.value.application_stack_use_dotnet_isolated_runtime
          java_version                = application_stack.value.application_stack_java_version
          node_version                = application_stack.value.application_stack_node_version
          powershell_core_version     = application_stack.value.application_stack_powershell_core_version
          use_custom_runtime          = application_stack.value.application_stack_use_custom_runtime
        }
      }

      dynamic "app_service_logs" {
        for_each = site_config.value.app_service_logs == null ? [] : [site_config.value.app_service_logs]
        content {
          disk_quota_mb         = app_service_logs.value.app_service_logs_disk_quota_mb
          retention_period_days = app_service_logs.value.app_service_logs_retention_period_days
        }
      }

      dynamic "cors" {
        for_each = site_config.value.site_config_cors_enabled == true ? [site_config.value.cors] : []
        content {
          allowed_origins     = cors.value.cors_allowed_origins
          support_credentials = cors.value.cors_support_credentials
        }
      }

      dynamic "ip_restriction" {
        for_each = site_config.value.ip_restriction_enabled == false ? {} : site_config.value.ip_restriction
        content {
          action                    = ip_restriction.value.ip_restriction_action
          ip_address                = ip_restriction.value.ip_restriction_ip_address
          name                      = ip_restriction.value.ip_restriction_name
          priority                  = ip_restriction.value.ip_restriction_priority
          service_tag               = ip_restriction.value.ip_restriction_service_tag
          virtual_network_subnet_id = lookup(ip_restriction.value, "ip_restriction_virtual_network_subnet_id_enabled", false) == true ? data.azurerm_subnet.ip_restriction_subnet["${each.key},${ip_restriction.key}"].id : null

          dynamic "headers" {
            for_each = ip_restriction.value.headers == null ? [] : [ip_restriction.value.headers]
            content {
              x_azure_fdid      = headers.value.ip_restriction_headers_x_azure_fdid
              x_fd_health_probe = headers.value.ip_restriction_headers_x_fd_health_probe
              x_forwarded_for   = headers.value.ip_restriction_headers_x_forwarded_for
              x_forwarded_host  = headers.value.ip_restriction_headers_x_forwarded_host
            }
          }
        }
      }

      dynamic "scm_ip_restriction" {
        for_each = site_config.value.scm_ip_restriction_enabled == false ? {} : site_config.value.scm_ip_restriction
        content {
          action                    = scm_ip_restriction.value.scm_ip_restriction_action
          ip_address                = scm_ip_restriction.value.scm_ip_restriction_ip_address
          name                      = scm_ip_restriction.value.scm_ip_restriction_name
          priority                  = scm_ip_restriction.value.scm_ip_restriction_priority
          service_tag               = scm_ip_restriction.value.scm_ip_restriction_service_tag
          virtual_network_subnet_id = lookup(scm_ip_restriction.value, "scm_ip_restriction_virtual_network_subnet_id_enabled", false) == true ? data.azurerm_subnet.scm_ip_restriction_subnet["${each.key},${scm_ip_restriction.key}"].id : null

          dynamic "headers" {
            for_each = scm_ip_restriction.value.headers == null ? [] : [scm_ip_restriction.value.headers]
            content {
              x_azure_fdid      = headers.value.scm_ip_restriction_headers_x_azure_fdid
              x_fd_health_probe = headers.value.scm_ip_restriction_headers_x_fd_health_probe
              x_forwarded_for   = headers.value.scm_ip_restriction_headers_x_forwarded_for
              x_forwarded_host  = headers.value.scm_ip_restriction_headers_x_forwarded_host
            }
          }
        }
      }

    }
  }

  tags = merge(each.value.windows_function_app_tags, tomap({ Created_Time = formatdate("DD-MM-YYYY hh:mm:ss ZZZ", timestamp()) }))
  lifecycle { ignore_changes = [tags["Created_Time"]] }
}
