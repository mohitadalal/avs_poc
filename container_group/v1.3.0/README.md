## Attributes:

    - container_group_log_analytics_workspace_name                = string #(Required) log analytics workspace name for the continer group
    - container_group_log_analytics_workspace_resource_group_name = string #(Required) resource group name for the log analytics work space
    - container_group_user_assigned_identity_name                 = string #(Reqired) user assign identity name for the user
    - container_group_user_assigned_identity_resource_group_name  = string #(Required) resource group name for the user assigned identity
    - container_group_key_vault_name                              = string #(Required) key valut for the continer for key valut key id
    - container_group_key_vault_resource_group_name               = string #(Required) key valut resource group name
    - container_group_is_subnet_required                          = bool   #(Optional) The subnet resource IDs for a container group. Changing this forces a new resource to be created.
    - container_group_subnet_name                                 = string #(Optional) subnet name should be pass when is subnet required is true
    - container_group_vnet_name                                   = string #(Optional) vnet name - should be pass when is subnet required is true
    - container_group_vnet_resource_group_name                    = string #(Optional)resource group name should be pass when is subnet required is true
    - container_group_key_vault_secret_name                       = string #(Optional)key valut secret name for to store the secret fot the key vault key
    - container_group_storage_account_name                        = string #(Optional) The Azure storage account from which the volume is to be mounted. Changing this forces a new resource to be created.
    - container_group_storage_account_resource_group_name         = string #(Optional) The Azure storage account resource group name from which the volume is to be mounted. Changing this forces a new resource to be created.
    - container_group_name                                        = string #(Required)  Specifies the name of the Container Group. Changing this forces a new resource to be created.
    - container_group_location                                    = string #(Required) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created.
    - container_group_sku                                         = string #(Optional) Specifies the sku of the Container Group. Possible values are Confidential, Dedicated and Standard. Defaults to Standard. Changing this forces a new resource to be created.
    - container_group_resource_group_name                         = string #(Required) The name of the resource group in which to create the Container Group. Changing this forces a new resource to be created.
    - container_group_ip_address_type                             = string # (Optional) Specifies the IP address type of the container. Public, Private or None. Changing this forces a new resource to be created. If set to Private, subnet_ids also needs to be set.
    - container_group_dns_name_label                              = string # (Optional) The DNS label/name for the container group's IP. Changing this forces a new resource to be created.
    - container_group_os_type                                     = string #(Required) The OS for the container group. Allowed values are Linux and Windows. Changing this forces a new resource to be created.
    - container_group_key_vault_key_id_enabled                    = bool   #(Optional) The Key Vault key URI for CMK encryption. Changing this forces a new resource to be created.
    - container_group_key_vault_user_assigned_identity_id_enabled = bool   #(Required)The user assigned identity that has access to the Key Vault Key. If not specified, the RP principal named "Azure Container Instance Service" will be used instead. Make sure the identity has the proper key_permissions set, at least with Get, UnwrapKey, WrapKey and GetRotationPolicy.
    - container_group_network_profile_id                          = string # (Optional) Network profile ID for deploying to virtual network.
    - container_group_restart_policy                              = string # (Optional) Restart policy for the container group. Allowed values are Always, Never, OnFailure. Defaults to Always. Changing this forces a new resource to be created.
    - container_group_generate_new_admin_password                 = bool   # (optional)continer group admin password
    - container_group_key_vault_key_name                          = string #(Optional) key vault key name for the key vault key id
    - identity = list(object)       #An identity block as defined below.
      - identity_type = string       #(Required) Specifies the type of Managed Service Identity that should be configured on this Container Group. Possible values are SystemAssigned, UserAssigned, SystemAssigned, UserAssigned (to enable both).
      - identity_ids  = list(string) # (Optional) Specifies a list of User Assigned Managed Identity IDs to be assigned to this Container Group.
    - init_container = list(object)
      - init_container_name                         = string       #(Required) Specifies the name of the Container. Changing this forces a new resource to be created.
      - init_container_image                        = string       #(Required) The container image name. Changing this forces a new resource to be created.
      - init_container_environment_variables        = map(string)  # (Optional) A list of environment variables to be set on the container. Specified as a map of name/value pairs. Changing this forces a new resource to be created.
      - init_container_secure_environment_variables = map(string)  #  (Optional) A list of sensitive environment variables to be set on the container. Specified as a map of name/value pairs. Changing this forces a new resource to be created.
      - init_container_commands                     = list(string) # (Optional) A list of commands which should be run on the container. Changing this forces a new resource to be created.
      - volume = list(object({                      # (Optional) The definition of a volume mount for this container as documented in the
        - volume_name                 = string      # (Required) The name of the volume mount. Changing this forces a new resource to be created.
        - volume_mount_path           = string      # (Required) The path on which this volume is to be mounted. Changing this forces a new resource to be created.
        - volume_read_only            = bool        #(Optional) Specify if the volume is to be mounted as read only or not. The default value is false. Changing this forces a new resource to be created.
        - volume_empty_dir            = bool        # (Optional) Boolean as to whether the mounted volume should be an empty directory. Defaults to false. Changing this forces a new resource to be created.
        - volume_storage_account_name = string      # (Optional) The Azure storage account from which the volume is to be mounted. Changing this forces a new resource to be created.
        volume_storage_account_key  = string      #(Optional) The access key for the Azure Storage account specified as above. Changing this forces a new resource to be created.
        - volume_share_name           = string      # (Optional) The Azure storage share that is to be mounted as a volume. This must be created on the storage account specified as above. Changing this forces a new resource to be created.
        - volume_secret               = map(string) #(Optional) A map of secrets that will be mounted as files in the volume. Changing this forces a new resource to be created.
        - git_repo = list(object)      # (Optional) A git_repo block as defined below.
          - git_repo_url       = string # (Required) Specifies the Git repository to be cloned. Changing this forces a new resource to be created.
         - git_repo_directory = string # (Optional) Specifies the directory into which the repository should be cloned. Changing this forces a new resource to be created.
          - git_repo_revision  = string # (Optional) Specifies the commit hash of the revision to be cloned. If unspecified, the HEAD revision is cloned. Changing this forces a new resource to be created.
        -  security = object({        #(Optional) The definition of the security context for this container as documented in the security block below. Changing this forces a new resource to be created.
          - privilege_enabled = bool #(Required) Whether the container's permission is elevated to privileged? Changing this forces a new resource to be created.
    - dns_config = list(object)                # (Optional) A dns_config block as documented below.
      - dns_config_nameservers    = list(string) # (Required) A list of nameservers the containers will search out to resolve requests.
      - dns_config_search_domains = list(string) #(Optional) A list of search domains that DNS requests will search along.
      - dns_config_options        = list(string) # (Optional) A list of resolver configuration options.
    - diagnostics = list(object)     #(Optional) A diagnostics block as documented below.
      - log_analytics = list(object({ # (Required) A log_analytics block as defined below. Changing this forces a new resource to be created.
      - log_type = string           #- (Optional) The log type which should be used. Possible values are ContainerInsights and ContainerInstanceLogs. Changing this forces a new resource to be created.
      - metadata = map(string)      # (Optional) Any metadata required for Log Analytics. Changing this forces a new resource to be created.
    - exposed_port = list(object({     # (Optional) Zero or more exposed_port blocks as defined below. Changing this forces a new resource to be created.
      - exposed_port          = number #(Required) The port number the container will expose. Changing this forces a new resource to be created.
      - exposed_port_protocol = string # (Required) The network protocol associated with port. Possible values are TCP & UDP. Changing this forces a new resource to be created.
    - image_registry_credential = list(object({     # (Optional) An image_registry_credential block as documented below. Changing this forces a new resource to be created.
      - image_registry_credential_username = string #(Optional) The username with which to connect to the registry. Changing this forces a new resource to be created.
      - image_registry_credential_password = string #(Optional) The password with which to connect to the registry. Changing this forces a new resource to be created.
      - image_registry_credential_server   = string # (Required) The address to use to connect to the registry without protocol ("https"/"http"). For example: "myacr.acr.io". Changing this forces a new resource to be created.
    container = list(object)                               # (Required) The definition of a container that is part of the group as documented in the container block below. Changing this forces a new resource to be created.
      - container_name                         = string       #(Required) Specifies the name of the Container. Changing this forces a new resource to be created.
      - container_image                        = string       # (Required) The container image name. Changing this forces a new resource to be created.
      - container_cpu                          = string       #- (Required) The required number of CPU cores of the containers. Changing this forces a new resource to be created.
      - container_memory                       = string       # (Required) The required memory of the containers in GB. Changing this forces a new resource to be created.
      - cpu_limit                              = string       # (Optional) The upper limit of the number of CPU cores of the containers.
      - memory_limit                           = string       #(Optional) The the upper limit of the memory of the containers in GB.
      - container_environment_variables        = map(string)  #(Optional) A list of environment variables to be set on the container. Specified as a map of name/value pairs. Changing this forces a new resource to be created.
      - container_secure_environment_variables = map(string)  # (Optional) A list of sensitive environment variables to be set on the container. Specified as a map of name/value pairs. Changing this forces a new resource to be created.
      - container_commands                     = list(string) # (Optional) A list of commands which should be run on the container. Changing this forces a new resource to be created.
      - gpu = list(object) # (Optional) A gpu block as defined below. Changing this forces a new resource to be created.
        - gpu_count = number #(Required) The number of GPUs which should be assigned to this container. Allowed values are 1, 2, or 4. Changing this forces a new resource to be created.
        - gpu_sku   = string # (Required) The SKU which should be used for the GPU. Possible values are K80, P100, or V100. Changing this forces a new resource to be created.
      - gpu_limit = object({       # (Optional) A gpu_limit block as defined below.
        - gpu_limit_count = number #(Optional) The upper limit of the number of GPUs which should be assigned to this container.
        - gpu_limit_sku   = string # (Optional) The allowed SKU which should be used for the GPU. Possible values are K80, P100, or V100.
      - readiness_probe = list(object)
        - readiness_probe_exec                  = list(string) #(Optional) Commands to be run to validate container readiness. Changing this forces a new resource to be created.
        - readiness_probe_initial_delay_seconds = number       # (Optional) The definition of the http_get for this container as documented in the http_get block below. Changing this forces a new resource to be created.
        - readiness_probe_period_seconds        = number       # (Optional) Number of seconds after the container has started before liveness or readiness probes are initiated. Changing this forces a new resource to be created.
        - readiness_probe_failure_threshold     = number       #Optional) How many times to try the probe before restarting the container (liveness probe) or marking the container as unhealthy (readiness probe). The default value is 3 and the minimum value is 1. Changing this forces a new resource to be created.
        - readiness_probe_success_threshold     = number       #(Optional) Minimum consecutive successes for the probe to be considered successful after having failed. The default value is 1 and the minimum value is 1. Changing this forces a new resource to be created.
        - readiness_probe_timeout_seconds       = number       #(Optional) Number of seconds after which the probe times out. The default value is 1 and the minimum value is 1. Changing this forces a new resource to be created.
        - http_get = list(object({   # (Optional) The definition of the http_get for this container as documented in the http_get block below. Changing this forces a new resource to be created.
          - http_get_path   = string # (Optional) Path to access on the HTTP server. Changing this forces a new resource to be created.
         - http_get_port   = number # (Optional) Number of the port to access on the container. Changing this forces a new resource to be created.
         - http_get_scheme = string # (Optional) Scheme to use for connecting to the host. Possible values are Http and Https. Changing this forces a new resource to be created.
      - liveness_probe = list(object)                      # (Optional) The definition of a readiness probe for this container as documented in the liveness_probe block below. Changing this forces a new resource to be created.
       - liveness_probe_exec                  = list(string) # (Optional) Commands to be run to validate container readiness. Changing this forces a new resource to be created.
        - liveness_probe_initial_delay_seconds = number       # (Optional) Number of seconds after the container has started before liveness or readiness probes are initiated. Changing this forces a new resource to be created.
        - liveness_probe_period_seconds        = number       # (Optional) How often (in seconds) to perform the probe. The default value is 10 and the minimum value is 1. Changing this forces a new resource to be created.
        - liveness_probe_failure_threshold     = number       # (Optional) How many times to try the probe before restarting the container (liveness probe) or marking the container as unhealthy (readiness probe). The default value is 3 and the minimum value is 1. Changing this forces a new resource to be created.
        - liveness_probe_success_threshold     = number       # (Optional) Minimum consecutive successes for the probe to be considered successful after having failed. The default value is 1 and the minimum value is 1. Changing this forces a new resource to be created.
        liveness_probe_timeout_seconds       = number       # (Optional) Number of seconds after which the probe times out. The default value is 1 and the minimum value is 1. Changing this forces a new resource to be created.
        - http_get = list(object)   #(Optional) The definition of the http_get for this container as documented in the http_get block below. Changing this forces a new resource to be created.
         - http_get_path   = string # (Optional) Path to access on the HTTP server. Changing this forces a new resource to be created.
          - http_get_port   = number # (Optional) Number of the port to access on the container. Changing this forces a new resource to be created.
          - http_get_scheme = string #(Optional) Scheme to use for connecting to the host. Possible values are Http and Https. Changing this forces a new resource to be created.
      volume = list(object)                 #(Optional) The definition of a volume mount for this container as documented in the volume block below. Changing this forces a new resource to be created.
       - volume_name                 = string      # (Required) The name of the volume mount. Changing this forces a new resource to be created.
        - volume_mount_path           = string      # (Required) The path on which this volume is to be mounted. Changing this forces a new resource to be created.
       - volume_read_only            = bool        #(Optional) Specify if the volume is to be mounted as read only or not. The default value is false. Changing this forces a new resource to be created.
       - volume_empty_dir            = bool        # (Optional) Boolean as to whether the mounted volume should be an empty directory. Defaults to false. Changing this forces a new resource to be created.
       - volume_storage_account_name = string      # (Optional) The Azure storage account from which the volume is to be mounted. Changing this forces a new resource to be created.
       - volume_storage_account_key  = string      #(Optional) The access key for the Azure Storage account specified as above. Changing this forces a new resource to be created.
       - volume_share_name           = string      # (Optional) The Azure storage share that is to be mounted as a volume. This must be created on the storage account specified as above. Changing this forces a new resource to be created.
        - volume_secret               = map(string) # (Optional) A map of secrets that will be mounted as files in the volume. Changing this forces a new resource to be created.
       - git_repo = list(object)
         - git_repo_url       = string # (Required) Specifies the Git repository to be cloned. Changing this forces a new resource to be created.
         - git_repo_directory = string #(Optional) Specifies the directory into which the repository should be cloned. Changing this forces a new resource to be created.
         - git_repo_revision  = string #(Optional) Specifies the commit hash of the revision to be cloned. If unspecified, the HEAD revision is cloned. Changing this forces a new resource to be created.
      - security = object({        #(Optional) The definition of the security context for this container as documented in the security block below. Changing this forces a new resource to be created.
        - privilege_enabled = bool #(Required) Whether the container's permission is elevated to privileged? Changing this forces a new resource to be created.
      - ports = list(object({     # (Optional) A set of public ports for the container. Changing this forces a new resource to be created. Set as documented in the ports block below.
        - port           = number #(Required) The port number the container will expose. Changing this forces a new resource to be created.
        - ports_protocol = string #(Required) The network protocol associated with port. Possible values are TCP & UDP. Changing this forces a new resource to be created.

## Notes:

> 1.network_profile_id is deprecated by Azure. For users who want to continue to manage existing azurerm_container_group that rely on network_profile_id, please stay on provider versions prior to v3.16.0. Otherwise, use subnet_ids instead.
> 2.if os_type is set to Windows currently only a single container block is supported. Windows containers are not supported in virtual networks.
> 3.DNS label/name is not supported when deploying to virtual networks.
> 4.The exposed_port can only contain ports that are also exposed on one or more containers in the group.
> 5.dns_name_label and os_type set to windows are not compatible with Private ip_address_type
> 6.When type is set to SystemAssigned, the identity of the Principal ID can be retrieved after the container group has been created. See documentation for more information.
> 7.identity_ids argument is required when type is set to UserAssigned or SystemAssigned, UserAssigned.
> 8.Currently you can't use a managed identity in a container group deployed to a virtual network.
> 9.Gpu resources are currently only supported in Linux containers.
> 10.Removing all exposed_port blocks requires setting exposed_port = [].
> 11.Omitting these blocks will default the exposed ports on the group to all ports on all containers defined in the container blocks of this group.
> 12.Exactly one of empty_dir volume, git_repo volume, secret volume or storage account volume (share_name, storage_account_name, and storage_account_key) must be specified.
> 13.when using a storage account volume, all of share_name, storage_account_name, and storage_account_key must be specified.
> 14.The secret values must be supplied as Base64 encoded strings, such as by using the Terraform base64encode function. The secret values are decoded to their original values when mounted in the volume on the container.
> 15. Currently, privilege_enabled argument only applies when the os_type is Linux and the sku is Confidential.
