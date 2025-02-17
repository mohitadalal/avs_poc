#KUBERNETES CLUSTER NODE POOL
kubernetes_cluster_node_pool_variables = {
  "kubernetes_cluster_node_pool_1" = {
    kubernetes_cluster_node_pool_kubernetes_cluster_name                        = "pncpocaks0001" #(Required) The name of the Kubernetes Cluster where this Node Pool should exist. Changing this forces a new resource to be created.
    kubernetes_cluster_node_pool_kubernetes_cluster_resource_group_name         = "PNC-POC-RG"    #(Required) The resource group of the Kubernetes Cluster where this Node Pool should exist. Changing this forces a new resource to be created.
    kubernetes_cluster_node_pool_node_public_ip_prefix_name                     = null            #(Optional) Resource ID for the Public IP Addresses Prefix for the nodes in this Node Pool. enable_node_public_ip should be true. Changing this forces a new resource to be created.
    kubernetes_cluster_node_pool_node_public_ip_prefix_resource_group_name      = null            #(optional) Resource Group name of the Public ip Prefix
    kubernetes_cluster_node_pool_proximity_placement_group_name                 = null            #(Optional) The ID of the Proximity Placement Group where the Virtual Machine Scale Set that powers this Node Pool will be placed. Changing this forces a new resource to be created.                               = string #(Optional) The Priority for Virtual Machines within the Virtual Machine Scale Set that powers this Node Pool. Possible values are Regular and Spot. Defaults to Regular. Changing this forces a new resource to be created.
    kubernetes_cluster_node_pool_proximity_placement_group_resource_group_name  = null            #(Optional) Resource Group Name of the Proximity placement Group
    kubernetes_cluster_node_pool_pod_subnet_name                                = null            #(Optional) The name of the Subnet where the pods in the Node Pool should exist. Changing this forces a new resource to be created.
    kubernetes_cluster_node_pool_pod_virtual_network_name                       = null            #(Optional) The name of the Vnet where kubernetes_cluster_node_pool_pod_subnet_name exist. Changing this forces a new resource to be created.
    kubernetes_cluster_node_pool_pod_virtual_network_resource_group_name        = null            #(Optional) Resource Group Name of the  Node pool pod Subnet
    kubernetes_cluster_node_pool_subnet_name                                    = null            #(Optional) The name of the Subnet where this Node Pool should exist. At this time the kubernetes_cluster_node_pool_subnet_name must be the same for all node pools in the cluster
    kubernetes_cluster_node_pool_virtual_network_name                           = null            #(Optional) The name of the Vnet where kubernetes_cluster_node_pool_subnet_name exists.
    kubernetes_cluster_node_pool_virtual_network_resource_group_name            = null            #(Optional) Resource group name of the Node pool subnet
    kubernetes_cluster_node_pool_dedicated_host_group_name                      = null            #(Optional) To fetch The fully qualified resource ID of the Dedicated Host Group to provision virtual machines from. Changing this forces a new resource to be created.
    kubernetes_cluster_node_pool_dedicated_host_group_resource_group_name       = null            #(Optional) To fetch The fully qualified resource ID of the Dedicated Host Group to provision virtual machines from. Changing this forces a new resource to be created.
    kubernetes_cluster_node_pool_snapshot_name                                  = null            #(Optional) Specifies the name of the Snapshot.
    kubernetes_cluster_node_pool_snapshot_resource_group_name                   = null            #(Optional) Specifies the name of the resource group the Snapshot is located in.
    kubernetes_cluster_node_pool_capacity_reservation_group_name                = null            #(Optional) To fetch Specifies the ID of the Capacity Reservation Group where this Node Pool should exist. Changing this forces a new resource to be created.
    kubernetes_cluster_node_pool_capacity_reservation_group_resource_group_name = null            #(Optional) To fetch Specifies the ID of the Capacity Reservation Group where this Node Pool should exist. Changing this forces a new resource to be created.
    kubernetes_cluster_node_pool_capacity_reservation_group_subscription_id     = null            #(Optional) To fetch Specifies the ID of the Capacity Reservation Group where this Node Pool should exist. Changing this forces a new resource to be created.
    kubernetes_cluster_node_pool_name                                           = "pncw01"        #(Required) The name of the Node Pool which should be created within the Kubernetes Cluster. A Windows Node Pool cannot have a name longer than 6 characters. 
    kubernetes_cluster_node_pool_vm_size                                        = "Standard_B2ms" #(Required) The SKU which should be used for the Virtual Machines used in this Node Pool. Changing this forces a new resource to be created.
    kubernetes_cluster_custom_ca_trust_enabled                                  = false           #(Optional) Specifies whether to trust a Custom CA.
    kubernetes_cluster_node_pool_enable_auto_scaling                            = true            #(Optional) Whether to enable auto-scaler. Defaults to false. If kubernetes_cluster_node_pool_enable_auto_scaling is set to true, then the following fields can also be configured:kubernetes_cluster_node_pool_max_count, kubernetes_cluster_node_pool_min_count. 2)If kubernetes_cluster_node_pool_enable_auto_scaling is set to false, then the following fields can also be configured:kubernetes_cluster_node_pool_node_count.
    kubernetes_cluster_node_pool_enable_host_encryption                         = false           #(Optional) Should the nodes in this Node Pool have host encryption enabled? Defaults to false.
    kubernetes_cluster_node_pool_enable_node_public_ip                          = true            #(Optional) Should each node have a Public IP Address? Defaults to false. Changing this forces a new resource to be created.
    kubernetes_cluster_node_pool_eviction_policy                                = null            #(Optional) The Eviction Policy which should be used for Virtual Machines within the Virtual Machine Scale Set powering this Node Pool. Possible values are Deallocate and Delete. Changing this forces a new resource to be created. An Eviction Policy can only be configured when priority is set to Spot and will default to Delete unless otherwise specified.
    kubernetes_cluster_node_pool_fips_enabled                                   = false           #(Optional) Should the nodes in this Node Pool have Federal Information Processing Standard enabled? Changing this forces a new resource to be created.
    kubernetes_cluster_node_pool_kubelet_disk_type                              = null            #(Optional) The type of disk used by kubelet. Possible values are OS and Temporary.
    kubernetes_cluster_node_pool_max_pods                                       = 30              #(Optional) The maximum number of pods that can run on each agent. Changing this forces a new resource to be created.
    kubernetes_cluster_node_pool_message_of_the_day                             = null            #(Optional) A base64-encoded string which will be written to /etc/motd after decoding. This allows customization of the message of the day for Linux nodes. It cannot be specified for Windows nodes and must be a static string (i.e. will be printed raw and not executed as a script). Changing this forces a new resource to be created.
    kubernetes_cluster_node_pool_mode                                           = null            #(Optional) Should this Node Pool be used for System or User resources? Possible values are System and User. Defaults to User.
    kubernetes_cluster_node_pool_node_labels                                    = null            #(Optional) A map of Kubernetes labels which should be applied to nodes in this Node Pool.
    kubernetes_cluster_node_pool_node_taints                                    = null            #(Optional) A list of Kubernetes taints which should be applied to nodes in the agent pool (e.g key=value:NoSchedule). Changing this forces a new resource to be created.
    kubernetes_cluster_node_pool_orchestrator_version                           = "1.30.1"        #(Optional) Version of Kubernetes used for the Agents. If not specified, the latest recommended version will be used at provisioning time (but won't auto-upgrade). This version must be supported by the Kubernetes Cluster - as such the version of Kubernetes used on the Cluster/Control Plane may need to be upgraded first.
    kubernetes_cluster_node_pool_os_disk_size_gb                                = "128"           #(Optional) The Agent Operating System disk size in GB. Changing this forces a new resource to be created.
    kubernetes_cluster_node_pool_os_disk_type                                   = "Managed"       #(Optional) The type of disk which should be used for the Operating System. Possible values are Ephemeral and Managed. Defaults to Managed. Changing this forces a new resource to be created.
    kubernetes_cluster_node_pool_os_sku                                         = "Windows2019"   #(Optional) Specifies the OS SKU used by the agent pool. Possible values include: AzureLinux, Ubuntu, Windows2019, Windows2022. If not specified, the default is Ubuntu if OSType=Linux or Windows2019 if OSType=Windows. And the default Windows OSSKU will be changed to Windows2022 after Windows2019 is deprecated. Changing this forces a new resource to be created.
    kubernetes_cluster_node_pool_os_type                                        = "Windows"       #(Optional) The Operating System which should be used for this Node Pool. Changing this forces a new resource to be created. Possible values are Linux and Windows. Defaults to Linux.
    kubernetes_cluster_node_pool_priority                                       = null            #(Optional) The Priority for Virtual Machines within the Virtual Machine Scale Set that powers this Node Pool. Possible values are Regular and Spot. Defaults to Regular. Changing this forces a new resource to be created.
    kubernetes_cluster_node_pool_spot_max_price                                 = null            #(Optional) This field can only be configured when priority is set to Spot. The maximum price you're willing to pay in USD per Virtual Machine. Valid values are -1 (the current on-demand price for a Virtual Machine) or a positive value with up to five decimal places. Changing this forces a new resource to be created.
    kubernetes_cluster_node_pool_scale_down_mode                                = null            #(Optional) Specifies how the node pool should deal with scaled-down nodes. Allowed values are Delete and Deallocate. Defaults to Delete. Cannot be set when priority is set to Spot.
    kubernetes_cluster_node_pool_ultra_ssd_enabled                              = true            #(Optional) Used to specify whether the UltraSSD is enabled in the Node Pool. Defaults to false
    kubernetes_cluster_node_pool_workload_runtime                               = "OCIContainer"  #(Optional) Used to specify the workload runtime. Allowed values are OCIContainer and WasmWasi.
    kubernetes_cluster_node_pool_zones                                          = ["1"]           #(Optional) Specifies a list of Availability Zones in which this Kubernetes Cluster Node Pool should be located. Changing this forces a new Kubernetes Cluster Node Pool to be created.
    #Below 2 parameter are required if kubernetes_cluster_node_pool_enable_auto_scaling is set to true
    kubernetes_cluster_node_pool_max_count = 3 #(Required)If enable_auto_scaling is set to true. (Required) The maximum number of nodes which should exist within this Node Pool. Valid values are between 0 and 1000 and must be greater than or equal to min_count.
    kubernetes_cluster_node_pool_min_count = 1 #(Required) The minimum number of nodes which should exist within this Node Pool. Valid values are between 0 and 1000 and must be less than or equal to max_count.
    #Below parameter (kubernetes_cluster_node_pool_node_count) is required if kubernetes_cluster_node_pool_enable_auto_scaling is false and optional if kubernetes_cluster_node_pool_enable_auto_scaling is true
    kubernetes_cluster_node_pool_node_count     = 2    #(Required) The number of nodes which should exist within this Node Pool. Valid values are between 0 and 1000 (inclusive) for user pools and between 1 and 1000 (inclusive) for system pools. If kubernetes_cluster_node_pool_enable_auto_scaling is true then The initial number of nodes which should exist within this Node Pool. Valid values are between 0 and 1000 (inclusive) for user pools and between 1 and 1000 (inclusive) for system pools and must be a value in the range min_count - max_count.
    kubernetes_cluster_node_pool_kubelet_config = null #(Optional) Assign null if not required. Changing any parameter within this block forces a new resource to be created
    # {    
    #   kubelet_config_allowed_unsafe_sysctls    =  ["net.*"] #(Optional) Specifies the allow list of unsafe sysctls command or patterns (ending in *). 
    #   kubelet_config_container_log_max_line    = 2       #(Optional) Specifies the maximum number of container log files that can be present for a container. must be at least 2. 
    #   kubelet_config_container_log_max_size_mb = "10MB"       # (Optional) Specifies the maximum size (e.g. 10MB) of container log file before it is rotated. 
    #   kubelet_config_cpu_cfs_quota_enabled     = false         #(Optional) Is CPU CFS quota enforcement for containers enabled? 
    #   kubelet_config_cpu_cfs_quota_period      = 5       #(Optional) Specifies the CPU CFS quota period value. 
    #   kubelet_config_cpu_manager_policy        = "none"       #(Optional) Specifies the CPU Manager policy to use. Possible values are none and static, 
    #   kubelet_config_image_gc_high_threshold   = 50       #(Optional) Specifies the percent of disk usage above which image garbage collection is always run. Must be between 0 and 100. 
    #   kubelet_config_image_gc_low_threshold    = 20       #(Optional) Specifies the percent of disk usage lower than which image garbage collection is never run. Must be between 0 and 100. 
    #   kubelet_config_pod_max_pid               = 10       #(Optional) Specifies the maximum number of processes per pod. 
    #   kubelet_config_topology_manager_policy   = "none"       #(Optional) Specifies the Topology Manager policy to use. Possible values are none, best-effort, restricted or single-numa-node. 
    # }
    kubernetes_cluster_node_pool_linux_os_config = null #(Optional) Assign null if not required. Changing any parameter within this block forces a new resource to be created
    # {      
    #   linux_os_config_swap_file_size_mb = 100                  #(Optional) Specifies the size of swap file on each node in MB. 
    #   linux_os_config_sysctl_config = {                    #(Optional) A sysctl_config block as defined below. Changing this forces a new resource to be created
    #     sysctl_config_fs_aio_max_nr                      = number #(Optional) The sysctl setting fs.aio-max-nr. Must be between 65536 and 6553500. 
    #     sysctl_config_fs_file_max                        = number #(Optional) The sysctl setting fs.file-max. Must be between 8192 and 12000500.
    #     sysctl_config_fs_inotify_max_user_watches        = number #(Optional) The sysctl setting fs.inotify.max_user_watches. Must be between 781250 and 2097152
    #     sysctl_config_fs_nr_open                         = number #(Optional) The sysctl setting fs.nr_open. Must be between 8192 and 20000500.
    #     sysctl_config_kernel_threads_max                 = number #(Optional) The sysctl setting kernel.threads-max. Must be between 20 and 513785
    #     sysctl_config_net_core_netdev_max_backlog        = number #(Optional) The sysctl setting net.core.netdev_max_backlog. Must be between 1000 and 3240000.
    #     sysctl_config_net_core_optmem_max                = number #(Optional) The sysctl setting net.core.optmem_max. Must be between 20480 and 4194304.
    #     sysctl_config_net_core_rmem_default              = number #(Optional) The sysctl setting net.core.rmem_default. Must be between 212992 and 134217728
    #     sysctl_config_net_core_rmem_max                  = number #(Optional) The sysctl setting net.core.rmem_max. Must be between 212992 and 134217728.
    #     sysctl_config_net_core_somaxconn                 = number #(Optional) The sysctl setting net.core.somaxconn. Must be between 4096 and 3240000
    #     sysctl_config_net_core_wmem_default              = number #(Optional) The sysctl setting net.core.wmem_default. Must be between 212992 and 134217728
    #     sysctl_config_net_core_wmem_max                  = number #(Optional) The sysctl setting net.core.wmem_max. Must be between 212992 and 134217728.
    #     sysctl_config_net_ipv4_ip_local_port_range_max   = number #(Optional) The sysctl setting net.ipv4.ip_local_port_range max value. Must be between 1024 and 60999.
    #     sysctl_config_net_ipv4_ip_local_port_range_min   = number #(Optional) The sysctl setting net.ipv4.ip_local_port_range min value. Must be between 1024 and 60999.
    #     sysctl_config_net_ipv4_neigh_default_gc_thresh1  = number #(Optional) The sysctl setting net.ipv4.neigh.default.gc_thresh1. Must be between 128 and 80000
    #     sysctl_config_net_ipv4_neigh_default_gc_thresh2  = number #(Optional) The sysctl setting net.ipv4.neigh.default.gc_thresh2. Must be between 512 and 90000.
    #     sysctl_config_net_ipv4_neigh_default_gc_thresh3  = number #(Optional) The sysctl setting net.ipv4.neigh.default.gc_thresh3. Must be between 1024 and 100000.
    #     sysctl_config_net_ipv4_tcp_fin_timeout           = number #(Optional) The sysctl setting net.ipv4.tcp_fin_timeout. Must be between 5 and 120
    #     sysctl_config_net_ipv4_tcp_keepalive_intvl       = number #(Optional) The sysctl setting net.ipv4.tcp_keepalive_intvl. Must be between 10 and 75. 
    #     sysctl_config_net_ipv4_tcp_keepalive_probes      = number #(Optional) The sysctl setting net.ipv4.tcp_keepalive_probes. Must be between 1 and 15.
    #     sysctl_config_net_ipv4_tcp_keepalive_time        = number #(Optional) The sysctl setting net.ipv4.tcp_keepalive_time. Must be between 30 and 432000.
    #     sysctl_config_net_ipv4_tcp_max_syn_backlog       = number #(Optional) The sysctl setting net.ipv4.tcp_max_syn_backlog. Must be between 128 and 3240000
    #     sysctl_config_net_ipv4_tcp_max_tw_buckets        = number #(Optional) The sysctl setting net.ipv4.tcp_max_tw_buckets. Must be between 8000 and 1440000.
    #     sysctl_config_net_ipv4_tcp_tw_reuse              = true   #(Optional) Is sysctl setting net.ipv4.tcp_tw_reuse enabled?
    #     sysctl_config_net_netfilter_nf_conntrack_buckets = number #(Optional) The sysctl setting net.netfilter.nf_conntrack_buckets. Must be between 65536 and 147456.
    #     sysctl_config_net_netfilter_nf_conntrack_max     = number #(Optional) The sysctl setting net.netfilter.nf_conntrack_max. Must be between 131072 and 1048576
    #     sysctl_config_vm_max_map_count                   = number #(Optional) The sysctl setting vm.max_map_count. Must be between 65530 and 262144.
    #     sysctl_config_vm_swappiness                      = number #(Optional) The sysctl setting vm.swappiness. Must be between 0 and 100
    #     sysctl_config_vm_vfs_cache_pressure              = number #(Optional) The sysctl setting vm.vfs_cache_pressure. Must be between 0 and 100
    #   }
    #   linux_os_config_transparent_huge_page_defrag  = "always" #(Optional) specifies the defrag configuration for Transparent Huge Page. Possible values are always, defer, defer+madvise, madvise and never.
    #   linux_os_config_transparent_huge_page_enabled = "always" #(Optional) Specifies the Transparent Huge Page enabled configuration. Possible values are always, madvise and never. 
    # }
    kubernetes_cluster_node_pool_tags = { #(Optional) A mapping of tags to assign to the resource.
      Owner       = "gowtham.nara@neudesic.com",
      Environment = "POC",
    }
    kubernetes_cluster_node_pool_upgrade_settings = null #(Optional) Assign null if not required.
    #  {
    #   upgrade_settings_max_surge = 50                    #(Required) The maximum number or percentage of nodes which will be added to the Node Pool size during an upgrade. If a percentage is provided, the number of surge nodes is calculated from the current node count on the cluster. Node surge can allow a cluster to have more nodes than max_count during an upgrade. Ensure that your cluster has enough IP space during an upgrade.
    # }
    kubernetes_cluster_node_pool_windows_profile = { #(Optional) A windows_profile block as documented below. Changing this forces a new resource to be created.
      windows_profile_outbound_nat_enabled = true    #(Optional) Should the Windows nodes in this Node Pool have outbound NAT enabled? Defaults to true. Changing this forces a new resource to be created.
    }
    kubernetes_cluster_node_pool_node_network_profile = null #(Optional) A node_network_profile block as documented below
    #   {
    #   node_network_profile_node_public_ip_tags = {}     #(Optional) Specifies a mapping of tags to the instance-level public IPs. Changing this forces a new resource to be created
    # }
  }
}


