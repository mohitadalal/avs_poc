#DATA BLOCK FOR KUBERENETES CLUSTER
data "azurerm_kubernetes_cluster" "kubernetes_cluster_id" {
  for_each            = var.kubernetes_cluster_node_pool_variables
  name                = each.value.kubernetes_cluster_node_pool_kubernetes_cluster_name
  resource_group_name = each.value.kubernetes_cluster_node_pool_kubernetes_cluster_resource_group_name
}

#DATA BLOCK FOR NODE POOL PUBLIC IP PREFIX
data "azurerm_public_ip_prefix" "kubernetes_cluster_node_pool_public_prefix_id" {
  for_each            = { for k, v in var.kubernetes_cluster_node_pool_variables : k => v if v.kubernetes_cluster_node_pool_node_public_ip_prefix_name != null }
  name                = each.value.kubernetes_cluster_node_pool_node_public_ip_prefix_name
  resource_group_name = each.value.kubernetes_cluster_node_pool_node_public_ip_prefix_resource_group_name
}

#DATA BLOCK FOR PROXIMITY PLACEMENT GROUP
data "azurerm_proximity_placement_group" "kubernetes_cluster_node_pool_proximity_placement_group_id" {
  for_each            = { for k, v in var.kubernetes_cluster_node_pool_variables : k => v if v.kubernetes_cluster_node_pool_proximity_placement_group_name != null }
  name                = each.value.kubernetes_cluster_node_pool_proximity_placement_group_name
  resource_group_name = each.value.kubernetes_cluster_node_pool_proximity_placement_group_resource_group_name
}

#DATA BLOCK FOR POD SUBNET
data "azurerm_subnet" "pod_subnet_id" {
  for_each             = { for k, v in var.kubernetes_cluster_node_pool_variables : k => v if v.kubernetes_cluster_node_pool_pod_subnet_name != null }
  name                 = each.value.kubernetes_cluster_node_pool_pod_subnet_name
  virtual_network_name = each.value.kubernetes_cluster_node_pool_pod_virtual_network_name
  resource_group_name  = each.value.kubernetes_cluster_node_pool_pod_virtual_network_resource_group_name
}

#DATA BLOCK FOR NODE POOL SUBNET
data "azurerm_subnet" "kubernetes_cluster_node_pool_subnet_id" {
  for_each             = { for k, v in var.kubernetes_cluster_node_pool_variables : k => v if v.kubernetes_cluster_node_pool_subnet_name != null }
  name                 = each.value.kubernetes_cluster_node_pool_subnet_name
  virtual_network_name = each.value.kubernetes_cluster_node_pool_virtual_network_name
  resource_group_name  = each.value.kubernetes_cluster_node_pool_virtual_network_resource_group_name
}

#DATA BLOCK FOR DEDICATED HOST GROUP
data "azurerm_dedicated_host_group" "dedicated_host_group" {
  for_each            = { for k, v in var.kubernetes_cluster_node_pool_variables : k => v if v.kubernetes_cluster_node_pool_dedicated_host_group_name != null }
  name                = each.value.kubernetes_cluster_node_pool_dedicated_host_group_name
  resource_group_name = each.value.kubernetes_cluster_node_pool_dedicated_host_group_resource_group_name
}

#DATA BLOCK FOR SNAPSHOT
data "azurerm_snapshot" "snapshot" {
  for_each            = { for k, v in var.kubernetes_cluster_node_pool_variables : k => v if v.kubernetes_cluster_node_pool_snapshot_name != null }
  name                = each.value.kubernetes_cluster_node_pool_snapshot_name
  resource_group_name = each.value.kubernetes_cluster_node_pool_snapshot_resource_group_name
}

#KUBERNETES CLUSTER NODE POOL
resource "azurerm_kubernetes_cluster_node_pool" "kubernetes_cluster_node_pool" {
  for_each                      = var.kubernetes_cluster_node_pool_variables
  name                          = each.value.kubernetes_cluster_node_pool_name
  kubernetes_cluster_id         = data.azurerm_kubernetes_cluster.kubernetes_cluster_id[each.key].id
  vm_size                       = each.value.kubernetes_cluster_node_pool_vm_size
  capacity_reservation_group_id = each.value.kubernetes_cluster_node_pool_capacity_reservation_group_name == null ? null : format("/subscriptions/%s/resourceGroups/%s/providers/Microsoft.Compute/capacityReservationGroups/%s", each.value.kubernetes_cluster_node_pool_capacity_reservation_group_subscription_id, each.value.kubernetes_cluster_node_pool_capacity_reservation_group_resource_group_name, each.value.kubernetes_cluster_node_pool_capacity_reservation_group_name)
  enable_auto_scaling           = each.value.kubernetes_cluster_node_pool_enable_auto_scaling
  enable_host_encryption        = each.value.kubernetes_cluster_node_pool_enable_host_encryption
  enable_node_public_ip         = each.value.kubernetes_cluster_node_pool_enable_node_public_ip
  eviction_policy               = each.value.kubernetes_cluster_node_pool_eviction_policy
  host_group_id                 = each.value.kubernetes_cluster_node_pool_dedicated_host_group_name != null ? data.azurerm_dedicated_host_group.dedicated_host_group[each.key].id : null
  fips_enabled                  = each.value.kubernetes_cluster_node_pool_fips_enabled
  kubelet_disk_type             = each.value.kubernetes_cluster_node_pool_kubelet_disk_type
  max_pods                      = each.value.kubernetes_cluster_node_pool_max_pods
  message_of_the_day            = each.value.kubernetes_cluster_node_pool_message_of_the_day
  mode                          = each.value.kubernetes_cluster_node_pool_mode
  node_labels                   = each.value.kubernetes_cluster_node_pool_node_labels
  node_public_ip_prefix_id      = each.value.kubernetes_cluster_node_pool_node_public_ip_prefix_name != null ? data.azurerm_public_ip_prefix.kubernetes_cluster_node_pool_public_prefix_id[each.key].id : null
  node_taints                   = each.value.kubernetes_cluster_node_pool_node_taints
  orchestrator_version          = each.value.kubernetes_cluster_node_pool_orchestrator_version
  os_disk_size_gb               = each.value.kubernetes_cluster_node_pool_os_disk_size_gb
  os_disk_type                  = each.value.kubernetes_cluster_node_pool_os_disk_type
  pod_subnet_id                 = each.value.kubernetes_cluster_node_pool_pod_subnet_name != null ? data.azurerm_subnet.pod_subnet_id[each.key].id : null
  os_sku                        = each.value.kubernetes_cluster_node_pool_os_sku
  os_type                       = each.value.kubernetes_cluster_node_pool_os_type
  priority                      = each.value.kubernetes_cluster_node_pool_priority
  proximity_placement_group_id  = each.value.kubernetes_cluster_node_pool_proximity_placement_group_name != null ? data.azurerm_proximity_placement_group.kubernetes_cluster_node_pool_proximity_placement_group_id[each.key].id : null
  spot_max_price                = each.value.kubernetes_cluster_node_pool_spot_max_price
  scale_down_mode               = each.value.kubernetes_cluster_node_pool_scale_down_mode
  ultra_ssd_enabled             = each.value.kubernetes_cluster_node_pool_ultra_ssd_enabled
  vnet_subnet_id                = each.value.kubernetes_cluster_node_pool_subnet_name == null ? null : data.azurerm_subnet.kubernetes_cluster_node_pool_subnet_id[each.key].id
  workload_runtime              = each.value.kubernetes_cluster_node_pool_workload_runtime
  zones                         = each.value.kubernetes_cluster_node_pool_zones
  max_count                     = each.value.kubernetes_cluster_node_pool_enable_auto_scaling == true ? each.value.kubernetes_cluster_node_pool_max_count : null
  min_count                     = each.value.kubernetes_cluster_node_pool_enable_auto_scaling == true ? each.value.kubernetes_cluster_node_pool_min_count : null
  node_count                    = each.value.kubernetes_cluster_node_pool_node_count
  dynamic "windows_profile" {
    for_each = each.value.kubernetes_cluster_node_pool_windows_profile != null ? each.value.kubernetes_cluster_node_pool_windows_profile : null
    content {
      outbound_nat_enabled = each.value.kubernetes_cluster_node_pool_windows_profile.windows_profile_outbound_nat_enabled
    }
  }
  # dynamic "node_network_profile" {
  #   for_each = each.value.kubernetes_cluster_node_pool_node_network_profile != null ? each.value.kubernetes_cluster_node_pool_node_network_profile : null
  #   content {
  #     node_public_ip_tags = node_network_profile.value.node_network_profile_node_public_ip_tags
  #   }
  # }
  dynamic "kubelet_config" {
    for_each = each.value.kubernetes_cluster_node_pool_kubelet_config != null ? [each.value.kubernetes_cluster_node_pool_kubelet_config] : []
    content {
      allowed_unsafe_sysctls    = kubelet_config.value.kubelet_config_allowed_unsafe_sysctls
      container_log_max_line    = kubelet_config.value.kubelet_config_container_log_max_line
      container_log_max_size_mb = kubelet_config.value.kubelet_config_container_log_max_size_mb
      cpu_cfs_quota_enabled     = kubelet_config.value.kubelet_config_cpu_cfs_quota_enabled
      cpu_cfs_quota_period      = kubelet_config.value.kubelet_config_cpu_cfs_quota_period
      cpu_manager_policy        = kubelet_config.value.kubelet_config_cpu_manager_policy
      image_gc_high_threshold   = kubelet_config.value.kubelet_config_image_gc_high_threshold
      image_gc_low_threshold    = kubelet_config.value.kubelet_config_image_gc_low_threshold
      pod_max_pid               = kubelet_config.value.kubelet_config_pod_max_pid
      topology_manager_policy   = kubelet_config.value.kubelet_config_topology_manager_policy
    }
  }
  dynamic "linux_os_config" {
    for_each = each.value.kubernetes_cluster_node_pool_linux_os_config != null ? [each.value.kubernetes_cluster_node_pool_linux_os_config] : []
    content {
      swap_file_size_mb = linux_os_config.value.linux_os_config_swap_file_size_mb
      dynamic "sysctl_config" {
        for_each = linux_os_config.value.linux_os_config_sysctl_config != null ? [linux_os_config.value.linux_os_config_sysctl_config] : []
        content {
          fs_aio_max_nr                      = sysctl_config.value.sysctl_config_fs_aio_max_nr
          fs_file_max                        = sysctl_config.value.sysctl_config_fs_file_max
          fs_inotify_max_user_watches        = sysctl_config.value.sysctl_config_fs_inotify_max_user_watches
          fs_nr_open                         = sysctl_config.value.sysctl_config_fs_nr_open
          kernel_threads_max                 = sysctl_config.value.sysctl_config_kernel_threads_max
          net_core_netdev_max_backlog        = sysctl_config.value.sysctl_config_net_core_netdev_max_backlog
          net_core_optmem_max                = sysctl_config.value.sysctl_config_net_core_optmem_max
          net_core_rmem_default              = sysctl_config.value.sysctl_config_net_core_rmem_default
          net_core_rmem_max                  = sysctl_config.value.sysctl_config_net_core_rmem_max
          net_core_somaxconn                 = sysctl_config.value.sysctl_config_net_core_somaxconn
          net_core_wmem_default              = sysctl_config.value.sysctl_config_net_core_wmem_default
          net_core_wmem_max                  = sysctl_config.value.sysctl_config_net_core_wmem_max
          net_ipv4_ip_local_port_range_max   = sysctl_config.value.sysctl_config_net_ipv4_ip_local_port_range_max
          net_ipv4_ip_local_port_range_min   = sysctl_config.value.sysctl_config_net_ipv4_ip_local_port_range_min
          net_ipv4_neigh_default_gc_thresh1  = sysctl_config.value.sysctl_config_net_ipv4_neigh_default_gc_thresh1
          net_ipv4_neigh_default_gc_thresh2  = sysctl_config.value.sysctl_config_net_ipv4_neigh_default_gc_thresh2
          net_ipv4_neigh_default_gc_thresh3  = sysctl_config.value.sysctl_config_net_ipv4_neigh_default_gc_thresh3
          net_ipv4_tcp_fin_timeout           = sysctl_config.value.sysctl_config_net_ipv4_tcp_fin_timeout
          net_ipv4_tcp_keepalive_intvl       = sysctl_config.value.sysctl_config_net_ipv4_tcp_keepalive_intvl
          net_ipv4_tcp_keepalive_probes      = sysctl_config.value.sysctl_config_net_ipv4_tcp_keepalive_probes
          net_ipv4_tcp_keepalive_time        = sysctl_config.value.sysctl_config_net_ipv4_tcp_keepalive_time
          net_ipv4_tcp_max_syn_backlog       = sysctl_config.value.sysctl_config_net_ipv4_tcp_max_syn_backlog
          net_ipv4_tcp_max_tw_buckets        = sysctl_config.value.sysctl_config_net_ipv4_tcp_max_tw_buckets
          net_ipv4_tcp_tw_reuse              = sysctl_config.value.sysctl_config_net_ipv4_tcp_tw_reuse
          net_netfilter_nf_conntrack_buckets = sysctl_config.value.sysctl_config_net_netfilter_nf_conntrack_buckets
          net_netfilter_nf_conntrack_max     = sysctl_config.value.sysctl_config_net_netfilter_nf_conntrack_max
          vm_max_map_count                   = sysctl_config.value.sysctl_config_vm_max_map_count
          vm_swappiness                      = sysctl_config.value.sysctl_config_vm_swappiness
          vm_vfs_cache_pressure              = sysctl_config.value.sysctl_config_vm_vfs_cache_pressure
        }
      }
      transparent_huge_page_defrag  = linux_os_config.value.linux_os_config_transparent_huge_page_defrag
      transparent_huge_page_enabled = linux_os_config.value.linux_os_config_transparent_huge_page_enabled
    }
  }
  dynamic "upgrade_settings" {
    for_each = each.value.kubernetes_cluster_node_pool_upgrade_settings != null ? [each.value.kubernetes_cluster_node_pool_upgrade_settings] : []
    content {
      max_surge = upgrade_settings.value.upgrade_settings_max_surge
    }
  }
  tags = merge(each.value.kubernetes_cluster_node_pool_tags, tomap({ Created_Time = formatdate("DD-MM-YYYY hh:mm:ss ZZZ", timestamp()) }))
  lifecycle { ignore_changes = [tags["Created_Time"]] }
}
