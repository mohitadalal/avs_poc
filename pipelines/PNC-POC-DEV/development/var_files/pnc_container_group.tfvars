#CONTAINER GROUP 
container_group_variables = {
  "container_group_1" = {
    container_group_log_analytics_workspace_name                = null          #(Required) log analytics workspace name for the continer group
    container_group_log_analytics_workspace_resource_group_name = null          #(Required) resource group name for the log analytics work space
    container_group_user_assigned_identity_name                 = null          #(Reqired) user assign identity name for the user 
    container_group_user_assigned_identity_resource_group_name  = null          ##(Required) resource group name for the user assigned identity
    container_group_key_vault_name                              = null          #(Required) key valut for the continer for key valut key id
    container_group_key_vault_resource_group_name               = null          #(Required) key valut resource group name
    container_group_storage_account_name                        = null          #(Optional) The Azure storage account from which the volume is to be mounted. Changing this forces a new resource to be created.
    container_group_storage_account_resource_group_name         = null          #(Optional) The Azure storage account resource group name from which the volume is to be mounted. Changing this forces a new resource to be created.
    container_group_name                                        = "pncpocaci01" #(Required)  Specifies the name of the Container Group. Changing this forces a new resource to be created.
    container_group_is_subnet_required                          = false         #(Optional) The subnet resource IDs for a container group. Changing this forces a new resource to be created.if true is provided we need pass subnet vnt and resurce group name
    container_group_subnet_name                                 = null          #(Optional) subnet name should be pass when is subnet required is true
    container_group_vnet_name                                   = null          #(Optional) vnet name should be pass when is subnet required is true
    container_group_vnet_resource_group_name                    = null          #(Optional)resource group name should be pass when is subnet required is true
    container_group_location                                    = "eastus"      #(Required) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created.should same as vnet resource group.
    container_group_resource_group_name                         = "PNC-POC-RG"  #(Required) The name of the resource group in which to create the Container Group. Changing this forces a new resource to be created.
    container_group_sku                                         = "Standard"    #(Optional) Specifies the sku of the Container Group. Possible values are Confidential, Dedicated and Standard. Defaults to Standard. Changing this forces a new resource to be created.
    container_group_ip_address_type                             = "Public"      # (Optional) Specifies the IP address type of the container. Public, Private or None. Changing this forces a new resource to be created. If set to Private, subnet_ids also needs to be set.
    container_group_dns_name_label                              = null          # (Optional) The DNS label/name for the container group's IP. Changing this forces a new resource to be created.
    container_group_os_type                                     = "Windows"     #(Required) The OS for the container group. Allowed values are Linux and Windows. Changing this forces a new resource to be created.
    container_group_key_vault_key_id_enabled                    = false         #(Required) The Key Vault key URI for CMK encryption. Changing this forces a new resource to be created.
    container_group_key_vault_user_assigned_identity_id_enabled = false         #(Required)The user assigned identity that has access to the Key Vault Key. If not specified, the RP principal named "Azure Container Instance Service" will be used instead. Make sure the identity has the proper key_permissions set, at least with Get, UnwrapKey, WrapKey and GetRotationPolicy.
    container_group_network_profile_id                          = null          # (Optional) Network profile ID for deploying to virtual network.
    container_group_restart_policy                              = "Always"      # (Optional) Restart policy for the container group. Allowed values are Always, Never, OnFailure. Defaults to Always. Changing this forces a new resource to be created.
    container_group_generate_new_admin_password                 = false         # (optional)continer group admin password
    container_group_key_vault_secret_name                       = null          #(Optional) key vault key name for the key vault key id
    container_group_key_vault_key_name                          = null          #(Optional) key vault key name for the key vault key id
    identity = {                                                                #An identity block as defined below.
      identity_type = "SystemAssigned"                                          #(Required) Specifies the type of Managed Service Identity that should be configured on this Container Group. Possible values are SystemAssigned, UserAssigned, SystemAssigned, UserAssigned (to enable both).
      identity_ids  = []                                                        # (Optional) Specifies a list of User Assigned Managed Identity IDs to be assigned to this Container Group.
    }
    init_container = null
    dns_config     = null           # (Optional) A dns_config block as documented below.
    diagnostics    = null           #(Optional) A diagnostics block as documented below.
    exposed_port = {                # (Optional) Zero or more exposed_port blocks as defined below. Changing this forces a new resource to be created.
      exposed_port          = 80    #(Required) The port number the container will expose. Changing this forces a new resource to be created.
      exposed_port_protocol = "TCP" # (Required) The network protocol associated with port. Possible values are TCP & UDP. Changing this forces a new resource to be created.
    }
    image_registry_credential = null                                                           # (Optional) An image_registry_credential block as documented below. Changing this forces a new resource to be created.
    container = {                                                                              # (Required) The definition of a container that is part of the group as documented in the container block below. Changing this forces a new resource to be created.
      container_name                         = "ploceuscont000001"                             #(Required) Specifies the name of the Container. Changing this forces a new resource to be created.
      container_image                        = "mcr.microsoft.com/windows/servercore:ltsc2019" # (Required) The container image name. Changing this forces a new resource to be created.
      container_cpu                          = "0.5"                                           #(Required) The required number of CPU cores of the containers. Changing this forces a new resource to be created.
      container_memory                       = "1.5"                                           #(Required) The required memory of the containers in GB. Changing this forces a new resource to be created.
      cpu_limit                              = null                                            # (Optional) The upper limit of the number of CPU cores of the containers.
      memory_limit                           = null                                            #(Optional) The the upper limit of the memory of the containers in GB.
      container_environment_variables        = {}                                              #(Optional) A list of environment variables to be set on the container. Specified as a map of name/value pairs. Changing this forces a new resource to be created.
      container_secure_environment_variables = {}                                              # (Optional) A list of sensitive environment variables to be set on the container. Specified as a map of name/value pairs. Changing this forces a new resource to be created.
      container_commands                     = []                                              # (Optional) A list of commands which should be run on the container. Changing this forces a new resource to be created.
      gpu                                    = null
      gpu_limit                              = null # (Optional) A gpu_limit block as defined below.
      readiness_probe                        = null #(Optional) Commands to be run to validate container readiness. Changing this forces a new resource to be created.
      liveness_probe                         = null # (Optional) The definition of a readiness probe for this container as documented in the liveness_probe block below. Changing this forces a new resource to be created.
      volume                                 = null #(Optional) The definition of a volume mount for this container as documented in the volume block below. Changing this forces a new resource to be created.
      security                               = null #(Optional) The definition of the security context for this container as documented in the security block below. Changing this forces a new resource to be created.
      ports = {                                     # (Optional) A set of public ports for the container. Changing this forces a new resource to be created. Set as documented in the ports block below.
        port           = 80                         #(Optional) The port number the container will expose. Changing this forces a new resource to be created.
        ports_protocol = "TCP"                      #(Optional) The network protocol associated with port. Possible values are TCP & UDP. Changing this forces a new resource to be created.
      }
    }
    container_group_tags = { # map of tages for the continer group.
      Owner       = "gowtham.nara@neudesic.com",
      Environment = "POC",
    }
  }
}
