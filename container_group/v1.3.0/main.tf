#Container Group module
locals {
  generate_new_password                           = { for k, v in var.container_group_variables : k => v if(lookup(v, "container_group_generate_new_admin_password", false) == true) }
  use_existing_password                           = { for k, v in var.container_group_variables : k => v if(lookup(v, "container_group_generate_new_admin_password", true) == false) }
  is_subnet_exists                                = { for k, v in var.container_group_variables : k => v if lookup(v, "container_group_is_subnet_required", false) == true }
  is_key_vault_key_id_required                    = { for k, v in var.container_group_variables : k => v if lookup(v, "container_group_key_vault_key_id_enabled", false) == true }
  is_key_vault_user_assigned_identity_id_required = { for k, v in var.container_group_variables : k => v if lookup(v, "container_group_key_vault_user_assigned_identity_id_enabled", false) == true }
}
data "azurerm_subnet" "subnet_id" {
  for_each             = local.is_subnet_exists
  name                 = each.value.container_group_subnet_name
  virtual_network_name = each.value.container_group_vnet_name
  resource_group_name  = each.value.container_group_resource_group_name
}

data "azurerm_log_analytics_workspace" "workspace_id" {
  for_each            = { for k, v in var.container_group_variables : k => v if lookup(v, "container_group_log_analytics_workspace_name", null) != null }
  name                = each.value.container_group_log_analytics_workspace_name
  resource_group_name = each.value.container_group_log_analytics_workspace_resource_group_name
}
data "azurerm_user_assigned_identity" "user_assigned_identity" {
  for_each            = local.is_key_vault_user_assigned_identity_id_required
  name                = each.value.container_group_user_assigned_identity_name
  resource_group_name = each.value.container_group_user_assigned_identity_resource_group_name
}

data "azurerm_storage_account" "storage_account" {
  for_each            = { for k, v in var.container_group_variables : k => v if lookup(v, "container_group_storage_account_name", null) != null }
  name                = each.value.container_group_storage_account_name
  resource_group_name = each.value.container_group_storage_account_resource_group_name
}

data "azurerm_key_vault" "key_vault_id" {
  for_each            = { for k, v in var.container_group_variables : k => v if lookup(v, "container_group_key_vault_name", null) != null }
  name                = each.value.container_group_key_vault_name
  resource_group_name = each.value.container_group_key_vault_resource_group_name
}
data "azurerm_key_vault_key" "key_vault_key_id" {
  for_each     = local.is_key_vault_key_id_required
  name         = each.value.container_group_key_vault_key_name
  key_vault_id = data.azurerm_key_vault.key_vault_id[each.key].id
}
data "azurerm_key_vault_secret" "existing_password_key_vault_secret" {
  for_each     = { for k, v in var.container_group_variables : k => v if lookup(v, "container_group_key_vault_secret_name", null) != null }
  name         = each.value.container_group_key_vault_secret_name
  key_vault_id = data.azurerm_key_vault.key_vault_id[each.key].id
}

resource "random_password" "password" {
  for_each    = local.generate_new_password
  length      = 12
  special     = true
  lower       = true
  upper       = true
  numeric     = true
  min_lower   = 4
  min_upper   = 4
  min_numeric = 2
  min_special = 2
}

resource "azurerm_key_vault_secret" "key_vault_secret" {
  for_each     = local.generate_new_password
  name         = each.value.container_group_key_vault_secret_name
  value        = random_password.password[each.key].result
  key_vault_id = data.azurerm_key_vault.key_vault_id[each.key].id
}
resource "azurerm_container_group" "container_group" {
  for_each                            = var.container_group_variables
  name                                = each.value.container_group_name
  location                            = each.value.container_group_location
  sku                                 = each.value.container_group_sku
  resource_group_name                 = each.value.container_group_resource_group_name
  subnet_ids                          = each.value.container_group_is_subnet_required == true ? [data.azurerm_subnet.subnet_id[each.key].id] : null
  ip_address_type                     = each.value.container_group_ip_address_type
  dns_name_label                      = each.value.container_group_dns_name_label
  os_type                             = each.value.container_group_os_type
  key_vault_key_id                    = each.value.container_group_key_vault_key_id_enabled == true ? data.azurerm_key_vault_key.key_vault_key_id[each.key].id : null
  key_vault_user_assigned_identity_id = each.value.container_group_key_vault_user_assigned_identity_id_enabled == true ? data.azurerm_user_assigned_identity.user_assigned_identity[each.key].id : null
  restart_policy                      = each.value.container_group_restart_policy
  dynamic "identity" {
    for_each = each.value.identity != null ? [each.value.identity] : []
    content {
      type         = identity.value.identity_type
      identity_ids = identity.value.identity_type == "UserAssigned" ? [data.azurerm_user_assigned_identity.user_assigned_identity[each.key].id] : null
    }
  }
  dynamic "init_container" {
    for_each = each.value.init_container != null ? [each.value.init_container] : []
    content {
      name                         = init_container.value.init_container_name
      image                        = init_container.value.init_container_image
      environment_variables        = init_container.value.init_container_environment_variables
      secure_environment_variables = init_container.value.init_container_secure_environment_variables
      commands                     = init_container.value.init_container_commands
      dynamic "volume" {
        for_each = init_container.value.volume != null ? [init_container.value.volume] : []
        content {
          name                 = volume.value.volume_name
          mount_path           = volume.value.volume_mount_path
          read_only            = volume.value.volume_read_only
          empty_dir            = volume.value.volume_empty_dir
          storage_account_name = data.azurerm_storage_account.storage_account[each.key].id
          storage_account_key  = data.azurerm_storage_account.storage_account[each.key].primary_access_key
          share_name           = volume.value.volume_share_name
          secret               = volume.value.volume_secret
          dynamic "git_repo" {
            for_each = volume.value.git_repo != null ? [volume.value.git_repo] : []
            content {
              url       = git_repo.value.git_repo_url
              directory = git_repo.value.git_repo_directory
              revision  = git_repo.value.git_repo_revision
            }
          }
        }
      }
      dynamic "security" {
        for_each = init_container.value.security != null ? [init_container.value.security] : []
        content {
          privilege_enabled = security.value.privilege_enabled
        }
      }
    }
  }
  dynamic "dns_config" {
    for_each = each.value.dns_config != null ? [each.value.dns_config] : []
    content {
      nameservers    = dns_config.value.dns_config_nameservers
      search_domains = dns_config.value.dns_config_search_domains
      options        = dns_config.value.dns_config_options
    }
  }
  dynamic "diagnostics" {
    for_each = each.value.diagnostics != null ? [each.value.diagnostics] : []
    content {
      dynamic "log_analytics" {
        for_each = diagnostics.value.log_analytics != null ? [diagnostics.value.log_analytics] : []
        content {
          log_type      = log_analytics.value.log_type
          workspace_id  = data.azurerm_log_analytics_workspace.workspace_id[each.key].workspace_id
          workspace_key = data.azurerm_log_analytics_workspace.workspace_id[each.key].primary_shared_key
          metadata      = log_analytics.value.metadata
        }
      }
    }
  }
  dynamic "exposed_port" {
    for_each = each.value.exposed_port != null ? [each.value.exposed_port] : []
    content {
      port     = exposed_port.value.exposed_port
      protocol = exposed_port.value.exposed_port_protocol
    }
  }
  dynamic "image_registry_credential" {
    for_each = each.value.image_registry_credential != null ? [each.value.image_registry_credential] : []
    content {
      username = image_registry_credential.value.username
      password = each.value.container_group_generate_new_admin_password == false ? data.azurerm_key_vault_secret.existing_password_key_vault_secret[each.key].value : random_password.password[each.key].result
      server   = image_registry_credential.value.server
    }
  }
  dynamic "container" {
    for_each = each.value.container != null ? [each.value.container] : []
    content {
      name                         = container.value.container_name
      image                        = container.value.container_image
      cpu                          = container.value.container_cpu
      memory                       = container.value.container_memory
      cpu_limit                    = container.value.cpu_limit
      memory_limit                 = container.value.cpu_limit
      environment_variables        = container.value.container_environment_variables
      secure_environment_variables = container.value.container_secure_environment_variables
      commands                     = container.value.container_commands
      dynamic "gpu" {
        for_each = container.value.gpu != null ? [container.value.gpu] : []
        content {
          count = gpu.value.gpu_count
          sku   = gpu.value.gpu_sku
        }
      }
      dynamic "gpu_limit" {
        for_each = container.value.gpu_limit != null ? [container.value.gpu_limit] : []
        content {
          count = gpu_limit.value.gpu_count
          sku   = gpu_limit.value.gpu_sku
        }
      }
      dynamic "readiness_probe" {
        for_each = container.value.readiness_probe != null ? [container.value.readiness_probe] : []
        content {
          exec                  = readiness_probe.value.readiness_probe_exec
          initial_delay_seconds = readiness_probe.value.readiness_probe_initial_delay_seconds
          period_seconds        = readiness_probe.value.readiness_probe_period_seconds
          failure_threshold     = readiness_probe.value.readiness_probe_failure_threshold
          success_threshold     = readiness_probe.value.readiness_probe_success_threshold
          timeout_seconds       = readiness_probe.value.readiness_probe_timeout_seconds
          dynamic "http_get" {
            for_each = readiness_probe.value.http_get != null ? [readiness_probe.value.http_get] : []
            content {
              path   = http_get.value.http_get_path
              port   = http_get.value.http_get_port
              scheme = http_get.value.http_get_scheme
            }
          }
        }
      }
      dynamic "liveness_probe" {
        for_each = container.value.liveness_probe != null ? [container.value.liveness_probe] : []
        content {
          exec                  = liveness_probe.value.liveness_probe_exec
          initial_delay_seconds = liveness_probe.value.liveness_probe_initial_delay_seconds
          period_seconds        = liveness_probe.value.liveness_probe_period_seconds
          failure_threshold     = liveness_probe.value.liveness_probe_failure_threshold
          success_threshold     = liveness_probe.value.liveness_probe_success_threshold
          timeout_seconds       = liveness_probe.value.liveness_probe_timeout_seconds
          dynamic "http_get" {
            for_each = liveness_probe.value.http_get != null ? [liveness_probe.value.http_get] : []
            content {
              path   = http_get.value.http_get_path
              port   = http_get.value.http_get_port
              scheme = http_get.value.http_get_scheme
            }
          }
        }
      }
      dynamic "volume" {
        for_each = container.value.volume != null ? [container.value.volume] : []
        content {
          name                 = volume.value.name
          mount_path           = volume.value.mount_path
          read_only            = volume.value.read_only
          empty_dir            = volume.value.empty_dir
          storage_account_name = data.azurerm_storage_account.storage_account[each.key].id
          storage_account_key  = data.azurerm_storage_account.storage_account[each.key].primary_access_key
          share_name           = volume.value.share_name
          secret               = volume.value.secret
          dynamic "git_repo" {
            for_each = volume.value.git_repo != null ? [volume.value.git_repo] : []
            content {
              url       = git_repo.value.git_repo_url
              directory = git_repo.value.git_repo_directory
              revision  = git_repo.value.git_repo_revision
            }
          }
        }
      }
      dynamic "security" {
        for_each = container.value.security != null ? [container.value.security] : []
        content {
          privilege_enabled = security.value.privilege_enabled
        }
      }
      dynamic "ports" {
        for_each = container.value.ports != null ? [container.value.ports] : []
        content {
          port     = ports.value.port
          protocol = ports.value.ports_protocol
        }
      }
    }
  }
  tags = merge(each.value.container_group_tags, tomap({ Created_Time = formatdate("DD-MM-YYYY hh:mm:ss ZZZ", timestamp()) }))
  lifecycle { ignore_changes = [tags["Created_Time"]] }
}
