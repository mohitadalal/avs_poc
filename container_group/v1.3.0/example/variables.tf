#RESOURCE GROUP VARIABLES FOR CONTAINER GROUP
variable "container_group_resource_group_variables" {
  type = map(object({
    resource_group_name       = string      #(Required) Name of the Resource Group with which it should be created.
    resource_group_location   = string      #(Required) The Azure Region where the Resource Group should exist.
    resource_group_managed_by = string      #(optional)  The ID of the resource or application that manages this Resource Group.
    resource_group_tags       = map(string) #(Optional) A mapping of tags which should be assigned to the Resource Group.
  }))
  description = "Map of Resource groups"
  default = {
  }
}

#RESOURCE GROUP VARIABLES FOR LOG ANALYTICS WORKSPACE
variable "log_analytics_workspace_resource_group_variables" {
  type = map(object({
    resource_group_name       = string      #(Required) Name of the Resource Group with which it should be created.
    resource_group_location   = string      #(Required) The Azure Region where the Resource Group should exist.
    resource_group_managed_by = string      #(optional)  The ID of the resource or application that manages this Resource Group.
    resource_group_tags       = map(string) #(Optional) A mapping of tags which should be assigned to the Resource Group.
  }))
  description = "Map of Resource groups"
  default = {
  }
}

#RESOURCE GROUP VARIABLES FOR KEY VAULT
variable "key_vault_resource_group_variables" {
  type = map(object({
    resource_group_name       = string      #(Required) Name of the Resource Group with which it should be created.
    resource_group_location   = string      #(Required) The Azure Region where the Resource Group should exist.
    resource_group_managed_by = string      #(optional)  The ID of the resource or application that manages this Resource Group.
    resource_group_tags       = map(string) #(Optional) A mapping of tags which should be assigned to the Resource Group.
  }))
  description = "Map of Resource groups"
  default = {
  }
}

#VIRTUAL NETWORK VARIABLES
variable "virtual_network_variables" {
  description = "Map of vnet objects. name, vnet_address_space, and dns_server supported"
  type = map(object({
    virtual_network_name                    = string       #(Required) the name of the virtual network. Changing this forces a new resource to be created.
    virtual_network_location                = string       #(Required) the location/region where the virtual network is created. Changing this forces a new resource to be created.
    virtual_network_resource_group_name     = string       #(Required) the name of the resource group in which to create the virtual network.
    virtual_network_address_space           = list(string) #(Required) the address space that is used the virtual network. You can supply more than one address space.
    virtual_network_dns_servers             = list(string) #(Optional) list of IP addresses of DNS servers.Since dns_servers can be configured both inline and via the separate azurerm_virtual_network_dns_servers resource, we have to explicitly set it to empty slice ([]) to remove it.
    virtual_network_flow_timeout_in_minutes = number       #(Optional) the flow timeout in minutes for the Virtual Network, which is used to enable connection tracking for intra-VM flows. Possible values are between 4 and 30 minutes.
    virtual_network_bgp_community           = string       #(Optional) the BGP community attribute in format <as-number>:<community-value>.
    virtual_network_ddos_protection_plan = object({        #(Optional) block for ddos protection
      virtual_network_ddos_protection_enable    = bool     #(Required) Enable/disable DDoS Protection Plan on Virtual Network.
      virtual_network_ddos_protection_plan_name = string   #(Required) for the ID of DDoS Protection Plan.
    })
    virtual_network_edge_zone = string                #(Optional) specifies the Edge Zone within the Azure Region where this Virtual Network should exist. Changing this forces a new Virtual Network to be created.
    virtual_network_encryption = list(object({        #(Optional) A encryption block as defined below.
      virtual_network_encryption_enforcement = string #(Required) Specifies if the encrypted Virtual Network allows VM that does not support encryption. Possible values are DropUnencrypted and AllowUnencrypted.
    }))
    virtual_network_subnet = list(object({                                       #(Optional) for the subnet block config. Set to null if not required
      virtual_network_subnet_name                                       = string #(Required) the subnet name to attach to vnet
      virtual_network_subnet_address_prefix                             = string #(Required) the address prefix to use for the subnet.
      virtual_network_subnet_network_security_group_name                = string #(Optional) the Network Security Group Name to associate with the subnet.
      virtual_network_subnet_network_security_group_resource_group_name = string #(Optional) the Network Security Group Resource Group to associate with the subnet.
    }))
    virtual_network_tags = map(string) #(Optional)a mapping of tags to assign to the resource.
  }))
  default = {}
}

#LOG ANALYTICS WORKSPACE VARIABLES
variable "log_analytics_workspace_variables" {
  description = "Map of objects of log analytics workspace"
  type = map(object({
    log_analytics_workspace_name                                   = string      #(Required) Specifies the name of the Log Analytics Workspace. Workspace name should include 4-63 letters, digits or '-'. The '-' shouldn't be the first or the last symbol. Changing this forces a new resource to be created.
    log_analytics_workspace_resource_group_name                    = string      #(Required) The name of the resource group in which the Log Analytics workspace is created. Changing this forces a new resource to be created.
    log_analytics_workspace_location                               = string      #(Required) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created
    log_analytics_workspace_allow_resource_only_permissions        = bool        #(Optional) Specifies if the log Analytics Workspace allow users accessing to data associated with resources they have permission to view, without permission to workspace. Defaults to true.
    log_analytics_workspace_local_authentication_disabled          = bool        #(Optional) Specifies if the log Analytics workspace should enforce authentication using Azure AD. Defaults to false.
    log_analytics_workspace_sku                                    = string      #(Optional) Specifies the SKU of the Log Analytics Workspace. Possible values are Free, PerNode, Premium, Standard, Standalone, Unlimited, CapacityReservation, and PerGB2018 (new SKU as of 2018-04-03). Defaults to PerGB2018
    log_analytics_workspace_retention_in_days                      = number      #(Optional) The workspace data retention in days. Possible values are either 7 (Free Tier only) or range between 30 and 730.
    log_analytics_workspace_daily_quota_gb                         = number      #(Optional) The workspace daily quota for ingestion in GB. Defaults to -1 (unlimited) if omitted.
    log_analytics_workspace_cmk_for_query_forced                   = bool        #(Optional) Is Customer Managed Storage mandatory for query management?
    log_analytics_workspace_internet_ingestion_enabled             = bool        #(Optional) Should the Log Analytics Workspace support ingestion over the Public Internet? Defaults to true
    log_analytics_workspace_internet_query_enabled                 = bool        #(Optional) Should the Log Analytics Workspace support querying over the Public Internet? Defaults to true
    log_analytics_workspace_reservation_capacity_in_gb_per_day     = number      #(Optional) The capacity reservation level in GB for this workspace. Must be in increments of 100 between 100 and 5000
    log_analytics_workspace_data_collection_rule_id                = string      #(Optional) The ID of the Data Collection Rule to use for this workspace.
    log_analytics_workspace_tags                                   = map(string) #(Optional) A mapping of tags to assign to the resource.
    log_analytics_workspace_key_vault_name                         = string      #(Required) specify the keyvault name to store the log analytics workspace keys.
    log_analytics_workspace_key_vault_resource_group_name          = string      #(Required) The name of the resource group in which the keyvault is present. 
    log_analytics_workspace_primary_shared_key_vault_secret_name   = string      #(Required) The name of the keyvault secret where the primary shared key of log analytics workspace is stored
    log_analytics_workspace_secondary_shared_key_vault_secret_name = string      #(Required) The name of the keyvault secret where the secondary shared key of log analytics workspace is stored
  }))
  default = {}
}

#USER ASSIGNED IDENTITY VARIABLES
variable "user_assigned_identity_variables" {
  type = map(object({
    user_assigned_identity_name                = string      #(Required) Specifies the name of this User Assigned Identity. Changing this forces a new User Assigned Identity to be created.
    user_assigned_identity_location            = string      # (Required) The Azure Region where the User Assigned Identity should exist. Changing this forces a new User Assigned Identity to be created.
    user_assigned_identity_resource_group_name = string      #Required) Specifies the name of the Resource Group within which this User Assigned Identity should exist. Changing this forces a new User Assigned Identity to be created.
    user_assigned_identity_tags                = map(string) #(Optional) A mapping of tags which should be assigned to the User Assigned Identity.
  }))
  description = "Map of User Assigned Identities"
  default     = {}
}

#KEY VAULT VARIABLES
variable "key_vault_variables" {
  type = map(object({
    key_vault_name                                  = string       #(Required) Specifies the name of the Key Vault, The name must be globally unique.
    key_vault_resource_group_name                   = string       #(Required) The name of the resource group in which to create the Key Vault.
    key_vault_location                              = string       #(Required) Specifies the supported Azure location where the resource exists.
    key_vault_enabled_for_disk_encryption           = bool         #(Optional) Boolean flag to specify whether Azure Disk Encryption is permitted to retrieve secrets from the vault and unwrap keys. Defaults to false.
    key_vault_enabled_for_deployment                = bool         #(Optional) Boolean flag to specify whether Azure Virtual Machines are permitted to retrieve certificates stored as secrets from the key vault. Defaults to false
    key_vault_enabled_for_template_deployment       = bool         # (Optional) Boolean flag to specify whether Azure Resource Manager is permitted to retrieve secrets from the key vault. Defaults to false.
    key_vault_enable_rbac_authorization             = bool         #(Optional) Boolean flag to specify whether Azure Key Vault uses Role Based Access Control (RBAC) for authorization of data actions. Defaults to false.
    key_vault_soft_delete_retention_days            = string       #(Optional) The number of days that items should be retained for once soft-deleted. This value can be between 7 and 90 (the default) days.
    key_vault_purge_protection_enabled              = bool         # (Optional) Is Purge Protection enabled for this Key Vault? Defaults to false.
    key_vault_sku_name                              = string       #(Required) The Name of the SKU used for this Key Vault. Possible values are standard and premium
    key_vault_access_container_agent_name           = string       #(Optional) Self hosted conatiner agent name.
    key_vault_access_policy_application_id          = string       #(Optional) The object ID of an Application in Azure Active Directory.
    key_vault_public_network_access_enabled         = bool         #(Optional) key_vault_public_network_access_enabled
    key_vault_access_policy_key_permissions         = list(string) #(Optional) List of key permissions, must be one or more from the following: Backup, Create, Decrypt, Delete, Encrypt, Get, Import, List, Purge, Recover, Restore, Sign, UnwrapKey, Update, Verify and WrapKey.
    key_vault_access_policy_secret_permissions      = list(string) #(Optional) List of secret permissions, must be one or more from the following: Backup, Delete, Get, List, Purge, Recover, Restore and Set.
    key_vault_access_policy_storage_permissions     = list(string) #(Optional) List of storage permissions, must be one or more from the following: Backup, Delete, DeleteSAS, Get, GetSAS, List, ListSAS, Purge, Recover, RegenerateKey, Restore, Set, SetSAS and Update.
    key_vault_access_policy_certificate_permissions = list(string) #(Optional) List of certificate permissions, must be one or more from the following: Backup, Create, Delete, DeleteIssuers, Get, GetIssuers, Import, List, ListIssuers, ManageContacts, ManageIssuers, Purge, Recover, Restore, SetIssuers and Update
    key_vault_tags                                  = map(string)  #(Optional) A mapping of tags which should be assigned to the key vault.
    key_vault_network_acls_enabled                  = bool         #(Optional) A network_acls block as defined below to be enabled or disabled
    key_vault_network_acls_bypass                   = string       #(Required) Specifies which traffic can bypass the network rules. Possible values are AzureServices and None.
    key_vault_network_acls_default_action           = string       # (Required) The Default Action to use when no rules match from ip_rules / virtual_network_subnet_ids. Possible values are Allow and Deny.
    key_vault_network_acls_ip_rules                 = list(string) # (Optional) One or more IP Addresses, or CIDR Blocks which should be able to access the Key Vault.
    #(Optional) One or more Subnet ID's which should be able to access this Key Vault.
    key_vault_network_acls_virtual_networks = list(object({
      key_vault_network_acls_virtual_networks_virtual_network_name    = string #(Required) Vitural Network name to be associated.
      key_vault_network_acls_virtual_networks_subnet_name             = string #(Required) Subnet Name to be associated.
      key_vault_network_acls_virtual_networks_subscription_id         = string #(Required) Subscription Id where Vnet is created.
      key_vault_network_acls_virtual_networks_virtual_network_rg_name = string #(Required) Resource group where Vnet is created.
    }))
    key_vault_contact_information_enabled = bool   #(Optional) One or more contact block as defined below to be enabled or disabled.
    key_vault_contact_email               = string #(Required) E-mail address of the contact.
    key_vault_contact_name                = string #(Optional) Name of the contact.
    key_vault_contact_phone               = string #(Optional) Phone number of the contact.
  }))
  description = "Map of Variables for Key Vault details"
  default = {
  }
}

# KEY VAULT KEY VARIABLES
variable "key_vault_key_variables" {
  description = "Map of object of key vault key variables"
  type = map(object({
    key_vault_name                = string          #(Required) The name of the Key Vault where the Key should be created.
    key_vault_resource_group_name = string          #(Required) The resource group name of the Key Vault where the Key should be created.
    key_vault_key_name            = string          #(Required) Specifies the name of the Key Vault Key.
    key_vault_key_key_type        = string          #(Required) Specifies the Key Type to use for this Key Vault Key. Possible values are EC (Elliptic Curve), EC-HSM, RSA and RSA-HSM.
    key_vault_key_key_size        = number          #(Optional) Specifies the Size of the RSA key to create in bytes. For example, 1024 or 2048. Note: This field is required if key_type is RSA or RSA-HSM.
    key_vault_key_curve           = string          #(Optional) Specifies the curve to use when creating an EC key. Possible values are P-256, P-256K, P-384, and P-521. This field will be required in a future release if key_type is EC or EC-HSM. The API will default to P-256 if nothing is specified.
    key_vault_key_key_opts        = list(string)    #(Required) A list of JSON web key operations. Possible values include: decrypt, encrypt, sign, unwrapKey, verify and wrapKey. Please note these values are case sensitive.
    key_vault_key_not_before_date = string          #(Optional) Key not usable before the provided UTC datetime (Y-m-d'T'H:M:S'Z').
    key_vault_key_expiration_date = string          #(Optional) Expiration UTC datetime (Y-m-d'T'H:M:S'Z').
    key_vault_key_rotation_policy = object({        #(Optional) A rotation_policy block as defined below.
      rotation_policy_expire_after         = string #(Optional) Expire a Key Vault Key after given duration as an ISO 8601 duration.
      rotation_policy_notify_before_expiry = string #(Optional) Notify at a given duration before expiry as an ISO 8601 duration. Default is P30D.
      rotation_policy_automatic = object({          #(Optional) An automatic block as defined below.
        automatic_time_after_creation = string      #(Optional) Rotate automatically at a duration after create as an ISO 8601 duration.
        automatic_time_before_expiry  = string      #(Optional) Rotate automatically at a duration before expiry as an ISO 8601 duration.
      })
    })
    key_vault_key_tags = map(string) #(Optional) A mapping of tags to assign to the resource.
  }))
  default = {}
}

#SUBNET VARIABLES
variable "subnet_variables" {
  type = map(object({
    subnet_name                                           = string       # (Required) The name of the subnet. Changing this forces a new resource to be created.
    subnet_resource_group_name                            = string       #(Required) The name of the resource group in which to create the subnet. Changing this forces a new resource to be created.
    subnet_virtual_network_name                           = string       #(Required) The name of the virtual network to which to attach the subnet. Changing this forces a new resource to be created.
    subnet_address_prefixes                               = list(string) #(Required) The address prefixes to use for the subnet.
    subnet_private_link_service_network_policies_enabled  = bool         # (Optional) Enable or Disable network policies for the private link service on the subnet. Setting this to true will Enable the policy and setting this to false will Disable the policy. Defaults to true.
    subnet_private_endpoint_network_policies_enabled      = bool         # (Optional) Enable or Disable network policies for the private endpoint on the subnet. Setting this to true will Enable the policy and setting this to false will Disable the policy. Defaults to true.
    subnet_service_endpoints                              = list(string) #(Optional) The list of Service endpoints to associate with the subnet. Possible values include: Microsoft.AzureActiveDirectory, Microsoft.AzureCosmosDB, Microsoft.ContainerRegistry, Microsoft.EventHub, Microsoft.KeyVault, Microsoft.ServiceBus, Microsoft.Sql, Microsoft.Storage and Microsoft.Web.
    subnet_enforce_private_link_endpoint_network_policies = bool         #(Optional) Enable or Disable network policies for the private link endpoint on the subnet. Setting this to true will Disable the policy and setting this to false will Enable the policy. Default value is false.
    subnet_enforce_private_link_service_network_policies  = bool         #(Optional) Enable or Disable network policies for the private link service on the subnet. Setting this to true will Disable the policy and setting this to false will Enable the policy. Default value is false.
    subnet_service_endpoint_policy_ids                    = list(string) #(Optional) The list of IDs of Service Endpoint Policies to associate with the subnet.
    delegation = list(object({
      delegation_name            = string       #(Required) A name for this delegation.
      service_delegation_name    = string       # (Required) The name of service to delegate to. Possible values include Microsoft.ApiManagement/service, Microsoft.AzureCosmosDB/clusters, Microsoft.BareMetal/AzureVMware, Microsoft.BareMetal/CrayServers, Microsoft.Batch/batchAccounts, Microsoft.ContainerInstance/containerGroups, Microsoft.ContainerService/managedClusters, Microsoft.Databricks/workspaces, Microsoft.DBforMySQL/flexibleServers, Microsoft.DBforMySQL/serversv2, Microsoft.DBforPostgreSQL/flexibleServers, Microsoft.DBforPostgreSQL/serversv2, Microsoft.DBforPostgreSQL/singleServers, Microsoft.HardwareSecurityModules/dedicatedHSMs, Microsoft.Kusto/clusters, Microsoft.Logic/integrationServiceEnvironments, Microsoft.LabServices/labplans,Microsoft.MachineLearningServices/workspaces, Microsoft.Netapp/volumes, Microsoft.Network/managedResolvers, Microsoft.Orbital/orbitalGateways, Microsoft.PowerPlatform/vnetaccesslinks, Microsoft.ServiceFabricMesh/networks, Microsoft.Sql/managedInstances, Microsoft.Sql/servers, Microsoft.StoragePool/diskPools, Microsoft.StreamAnalytics/streamingJobs, Microsoft.Synapse/workspaces, Microsoft.Web/hostingEnvironments, Microsoft.Web/serverFarms, NGINX.NGINXPLUS/nginxDeployments and PaloAltoNetworks.Cloudngfw/firewalls.
      service_delegation_actions = list(string) #(Optional) A list of Actions which should be delegated. This list is specific to the service to delegate to. Possible values include Microsoft.Network/publicIPAddresses/read,Microsoft.Network/virtualNetworks/read,Microsoft.Network/networkinterfaces/*, Microsoft.Network/virtualNetworks/subnets/action, Microsoft.Network/virtualNetworks/subnets/join/action, Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action and Microsoft.Network/virtualNetworks/subnets/unprepareNetworkPolicies/action.
    }))
  }))
  default = {}
}

#KEY VAULT ACCESS POLICY VARIABLES
variable "key_vault_access_policy_variables" {
  type = map(object({
    key_vault_access_policy_key_permissions         = list(string) #(Optional) List of key permissions, must be one or more from the following: Backup, Create, Decrypt, Delete, Encrypt, Get, Import, List, Purge, Recover, Restore, Sign, UnwrapKey, Update, Verify, WrapKey, Release, Rotate, GetRotationPolicy, and SetRotationPolicy.
    key_vault_access_policy_secret_permissions      = list(string) #(Optional) List of secret permissions, must be one or more from the following: Backup, Delete, Get, List, Purge, Recover, Restore and Set.
    key_vault_access_policy_storage_permissions     = list(string) #(Optional) List of storage permissions, must be one or more from the following: Backup, Delete, DeleteSAS, Get, GetSAS, List, ListSAS, Purge, Recover, RegenerateKey, Restore, Set, SetSAS and Update.
    key_vault_access_policy_certificate_permissions = list(string) #(Optional) List of certificate permissions, must be one or more from the following: Backup, Create, Delete, DeleteIssuers, Get, GetIssuers, Import, List, ListIssuers, ManageContacts, ManageIssuers, Purge, Recover, Restore, SetIssuers and Update.
    key_vault_name                                  = string       #(Required) Specifies the name of the Key Vault resource.
    key_vault_resource_group_name                   = string       #(Required) Specifies the resource group name where the key vault resides in.
    key_vault_access_resource_name                  = string       #(Required) Specifies the resource name that needs the access policy to the key vault. Possible values are username, group name, service principal name and application name 
    key_vault_access_resource_type                  = string       #(Required) Specifies the type of resource that needs the access policy to the key vault. Possible values are User, SPN, Group, Application
  }))
  description = "Map of variables for key vault access policies"
  default     = {}
}

# STORAGE ACCOUNT VARIABLES
variable "storage_account_variables" {
  description = "Map of object of storage account variables"
  type = map(object({
    storage_account_key_vault_name                                     = string #(Required) The name of the Key Vault.
    storage_account_key_vault_resource_group_name                      = string #(Required) The resource group name of the Key Vault.
    storage_account_key_vault_key_name                                 = string #(Required) The name of the Key Vault key required for customer managed key.
    storage_account_user_assigned_identity_name_for_cmk                = string #(Required) The name of a user assigned identity for customer managed key.
    storage_account_user_assigned_identity_resource_group_name_for_cmk = string #(Required) The resource group name of a user assigned identity for customer managed key.
    storage_account_identity_type_for_cmk                              = string #(Required) The identity type of a user assigned identity for customer managed key. Possible values could be "UserAssigned", "SystemAssigned", "SystemAssigned, UserAssigned".
    storage_account_name                                               = string #(Required) Specifies the name of the storage account. Only lowercase Alphanumeric characters allowed.This must be unique across the entire Azure service, not just within the resource group.
    storage_account_resource_group_name                                = string #(Required) The name of the resource group in which to create the storage account.
    storage_account_location                                           = string #(Required) Specifies the supported Azure location where the resource exists. 
    storage_account_account_kind                                       = string #(Optional) Defines the Kind of account. Valid options are BlobStorage, BlockBlobStorage, FileStorage, Storage and StorageV2. Defaults to StorageV2.
    storage_account_account_tier                                       = string #(Required) Defines the Tier to use for this storage account. Valid options are Standard and Premium. For BlockBlobStorage and FileStorage accounts only Premium is valid.
    storage_account_account_replication_type                           = string #(Required) Defines the type of replication to use for this storage account. Valid options are LRS, GRS, RAGRS, ZRS, GZRS and RAGZRS. Changing this forces a new resource to be created when types LRS, GRS and RAGRS are changed to ZRS, GZRS or RAGZRS and vice versa.
    storage_account_cross_tenant_replication_enabled                   = bool   #(Optional) Should cross Tenant replication be enabled? Defaults to true.
    storage_account_access_tier                                        = string #(Optional) Defines the access tier for BlobStorage, FileStorage and StorageV2 accounts. Valid options are Hot and Cool, defaults to Hot.
    storage_account_edge_zone                                          = string #(Optional) Specifies the Edge Zone within the Azure Region where this Storage Account should exist.
    storage_account_enable_https_traffic_only                          = bool   #(Optional) Boolean flag which forces HTTPS if enabled. Defaults to true.
    storage_account_min_tls_version                                    = string #(Optional) The minimum supported TLS version for the storage account. Possible values are TLS1_0, TLS1_1, and TLS1_2. Defaults to TLS1_2 for new storage accounts.
    storage_account_allow_nested_items_to_be_public                    = bool   #Allow or disallow nested items within this Account to opt into being public. Defaults to true.
    storage_account_shared_access_key_enabled                          = bool   #Indicates whether the storage account permits requests to be authorized with the account access key via Shared Key. If false, then all requests, including shared access signatures, must be authorized with Azure Active Directory (Azure AD). The default value is true.
    storage_account_public_network_access_enabled                      = bool   #(Optional) Whether the public network access is enabled? Defaults to true.
    storage_account_default_to_oauth_authentication                    = bool   #(Optional) Default to Azure Active Directory authorization in the Azure portal when accessing the Storage Account. The default value is false
    storage_account_allowed_copy_scope                                 = string #(Optional) Restrict copy to and from Storage Accounts within an AAD tenant or with Private Links to the same VNet. Possible values are AAD and PrivateLink.
    storage_account_is_hns_enabled                                     = bool   #(Optional) Is Hierarchical Namespace enabled? This can be used with Azure Data Lake Storage Gen 2.
    storage_account_nfsv3_enabled                                      = bool   #(Optional) Is NFSv3 protocol enabled? Defaults to false.
    storage_account_large_file_share_enabled                           = bool   #(Optional) Is Large File Share Enabled?
    storage_account_queue_encryption_key_type                          = string #(Optional) The encryption type of the queue service. Possible values are Service and Account.Default value is Service.
    storage_account_table_encryption_key_type                          = string #(Optional) The encryption type of the table service. Possible values are Service and Account. Default value is Service.
    storage_account_infrastructure_encryption_enabled                  = bool   #(Optional) Is infrastructure encryption enabled? Defaults to false.
    storage_account_sftp_enabled                                       = bool   #(Optional) Boolean, enable SFTP for the storage account, to enable this, is_hns_enabled should be true as well
    storage_account_custom_domain = object({
      custom_domain_name          = string #(Required) The Custom Domain Name to use for the Storage Account, which will be validated by Azure.
      custom_domain_use_subdomain = bool   #(Optional) Should the Custom Domain Name be validated by using indirect CNAME validation?
    })

    storage_account_identity = object({
      storage_account_identity_type = string # Possible values could be "UserAssigned", "SystemAssigned", "SystemAssigned, UserAssigned"
      storage_account_user_assigned_identity_ids = list(object({
        identity_name                = string
        identity_resource_group_name = string
      }))
    })

    storage_account_blob_properties = object({
      versioning_enabled            = bool   #(Optional) Is versioning enabled? Default to false.
      change_feed_enabled           = bool   #(Optional) Is the blob service properties for change feed events enabled? Default to false.
      change_feed_retention_in_days = number #(Optional) The duration of change feed events retention in days. The possible values are between 1 and 146000 days (400 years). Setting this to null (or omit this in the configuration file) indicates an infinite retention of the change feed.
      default_service_version       = string #(Optional) The API Version which should be used by default for requests to the Data Plane API if an incoming request doesn't specify an API Version. Defaults to 2020-06-12.
      last_access_time_enabled      = bool   #(Optional) Is the last access time based tracking enabled? Default to false.

      cors_enabled = bool #(optional) Should cross origin resource sharing be enabled
      cors_rule = object({
        allowed_headers    = list(string) #(Required) A list of headers that are allowed to be a part of the cross-origin request.
        allowed_methods    = list(string) #(Required) A list of HTTP methods that are allowed to be executed by the origin. Valid options are DELETE, GET, HEAD, MERGE, POST, OPTIONS, PUT or PATCH.
        allowed_origins    = list(string) #(Required) A list of origin domains that will be allowed by CORS.
        exposed_headers    = list(string) #(Required) A list of response headers that are exposed to CORS clients.
        max_age_in_seconds = number       #(Required) The number of seconds the client should cache a preflight response.
      })
      restore_policy = object({
        restore_policy_days = string #(Required) Specifies the number of days that the blob can be restored, between 1 and 365 days. This must be less than the days specified for delete_retention_policy.
      })
      delete_retention_policy = object({
        delete_retention_policy_days = string #(Optional) Specifies the number of days that the blob should be retained, between 1 and 365 days. Defaults to 7.
      })

      container_delete_retention_policy = object({
        container_delete_retention_policy_days = string #(Optional) Specifies the number of days that the container should be retained, between 1 and 365 days. Defaults to 7.
      })
    })

    storage_account_queue_properties = object({
      cors_enabled = bool #(optional) Should cross origin resource sharing be enabled.
      cors_rule = object({
        allowed_headers    = list(string) #(Required) A list of headers that are allowed to be a part of the cross-origin request.
        allowed_methods    = list(string) #(Required) A list of HTTP methods that are allowed to be executed by the origin. Valid options are DELETE, GET, HEAD, MERGE, POST, OPTIONS, PUT or PATCH.
        allowed_origins    = list(string) #(Required) A list of origin domains that will be allowed by CORS.
        exposed_headers    = list(string) #(Required) A list of response headers that are exposed to CORS clients.
        max_age_in_seconds = number       #(Required) The number of seconds the client should cache a preflight response.
      })

      logging_enabled = bool #Should storage account queue properties logging be enabled.
      logging = object({
        delete                = bool   #(Required) Indicates whether all delete requests should be logged. 
        read                  = bool   #(Required) Indicates whether all read requests should be logged. 
        version               = string #(Required) The version of storage analytics to configure.
        write                 = bool   #(Required) Indicates whether all write requests should be logged.
        retention_policy_days = number #(Optional) Specifies the number of days that logs will be retained.
      })

      minute_metrics = object({
        enabled               = bool   #(Required) Indicates whether minute metrics are enabled for the Queue service. 
        version               = string #(Required) The version of storage analytics to configure. 
        include_apis          = bool   #(Optional) Indicates whether metrics should generate summary statistics for called API operations.
        retention_policy_days = number #(Optional) Specifies the number of days that logs will be retained.
      })

      hour_metrics = object({
        enabled               = bool   #(Required) Indicates whether minute metrics are enabled for the Queue service. 
        version               = string #(Required) The version of storage analytics to configure. 
        include_apis          = bool   #(Optional) Indicates whether metrics should generate summary statistics for called API operations.
        retention_policy_days = number #(Optional) Specifies the number of days that logs will be retained.
      })
    })

    storage_account_static_website = object({
      index_document     = string #Optional) The webpage that Azure Storage serves for requests to the root of a website or any subfolder. For example, index.html. The value is case-sensitive.
      error_404_document = string #(Optional) The absolute path to a custom webpage that should be used when a request is made which does not correspond to an existing file.
    })

    storage_account_share_properties = object({
      cors_enabled = bool #(optional) Should cross origin resource sharing be enabled.
      cors_rule = object({
        allowed_headers    = list(string) #(Required) A list of headers that are allowed to be a part of the cross-origin request.
        allowed_methods    = list(string) #(Required) A list of HTTP methods that are allowed to be executed by the origin. Valid options are DELETE, GET, HEAD, MERGE, POST, OPTIONS, PUT or PATCH.
        allowed_origins    = list(string) #(Required) A list of origin domains that will be allowed by CORS.
        exposed_headers    = list(string) #(Required) A list of response headers that are exposed to CORS clients.
        max_age_in_seconds = number       #(Required) The number of seconds the client should cache a preflight response.
      })

      retention_policy = object({
        retention_policy_days = number #(Optional) Specifies the number of days that the azurerm_storage_share should be retained, between 1 and 365 days. Defaults to 7.
      })

      smb = object({
        smb_versions                        = set(string) #(Optional) A set of SMB protocol versions. Possible values are SMB2.1, SMB3.0, and SMB3.1.1.
        smb_authentication_types            = set(string) #(Optional) A set of SMB authentication methods. Possible values are NTLMv2, and Kerberos.
        smb_kerberos_ticket_encryption_type = set(string) #(Optional) A set of Kerberos ticket encryption. Possible values are RC4-HMAC, and AES-256.
        smb_channel_encryption_type         = set(string) #(Optional) A set of SMB channel encryption. Possible values are AES-128-CCM, AES-128-GCM, and AES-256-GCM.
        smb_multichannel_enabled            = bool        #(Optional) Indicates whether multichannel is enabled. Defaults to false. This is only supported on Premium storage accounts.
      })
    })

    storage_account_network_rules = object({
      default_action = string       #(Required) Specifies the default action of allow or deny when no other rules match. Valid options are Deny or Allow.
      bypass         = list(string) #(Optional) Specifies whether traffic is bypassed for Logging/Metrics/AzureServices. Valid options are any combination of Logging, Metrics, AzureServices, or None.
      ip_rules       = list(string) #(Optional) List of public IP or IP ranges in CIDR Format. Only IPv4 addresses are allowed. Private IP address ranges (as defined in RFC 1918) are not allowed.

      storage_account_network_rules_vnet_subnets = list(object({
        storage_account_network_rules_virtual_network_name = string #(Required) Vitural Network name to be associated.
        storage_account_network_rules_subnet_name          = string #(Required) Subnet Name to be associated.
        storage_account_network_rules_vnet_subscription_id = string #(Required) Subscription Id where Vnet is created.
        storage_account_network_rules_vnet_rg_name         = string #(Required) Resource group where Vnet is created.
      }))

      private_link_access = map(object({
        endpoint_resource_id = string
        endpoint_tenant_id   = string
      }))
    })

    storage_account_azure_files_authentication = object({
      directory_type = string #(Required) Specifies the directory service used. Possible values are AADDS and AD.
      active_directory = object({
        storage_sid         = string #(Required) Specifies the security identifier (SID) for Azure Storage.
        domain_name         = string #(Required) Specifies the primary domain that the AD DNS server is authoritative for.
        domain_sid          = string #(Required) Specifies the security identifier (SID).
        domain_guid         = string #(Required) Specifies the domain GUID.
        forest_name         = string #(Required) Specifies the Active Directory forest.
        netbios_domain_name = string #(Required) Specifies the NetBIOS domain name.
      })
    })

    storage_account_routing = object({
      publish_internet_endpoints  = bool   #(Optional) Should internet routing storage endpoints be published? Defaults to false.
      publish_microsoft_endpoints = bool   #(Optional) Should Microsoft routing storage endpoints be published? Defaults to false.
      choice                      = string #(Optional) Specifies the kind of network routing opted by the user. Possible values are InternetRouting and MicrosoftRouting. Defaults to MicrosoftRouting.
    })

    storage_account_immutability_policy = object({
      allow_protected_append_writes = bool   #(Required) When enabled, new blocks can be written to an append blob while maintaining immutability protection and compliance. Only new blocks can be added and any existing blocks cannot be modified or deleted.
      state                         = string #(Required) Defines the mode of the policy. Disabled state disables the policy, Unlocked state allows increase and decrease of immutability retention time and also allows toggling allowProtectedAppendWrites property, Locked state only allows the increase of the immutability retention time. A policy can only be created in a Disabled or Unlocked state and can be toggled between the two states. Only a policy in an Unlocked state can transition to a Locked state which cannot be reverted.
      period_since_creation_in_days = number #(Required) The immutability period for the blobs in the container since the policy creation, in days.
    })

    storage_account_sas_policy = object({
      expiration_period = string #(Required) The SAS expiration period in format of DD.HH:MM:SS.
      expiration_action = string #(Optional) The SAS expiration action. The only possible value is Log at this moment. Defaults to Log.
    })

    storage_account_tags = map(string) #(Optional) A mapping of tags to assign to the resource.
  }))
  default = {}
}

#CONTAINER GROUP VARIABLES
variable "container_group_variables" {
  type = map(object({
    container_group_log_analytics_workspace_name                = string #(Required) log analytics workspace name for the continer group
    container_group_log_analytics_workspace_resource_group_name = string #(Required) resource group name for the log analytics work space
    container_group_user_assigned_identity_name                 = string #(Reqired) user assign identity name for the user 
    container_group_user_assigned_identity_resource_group_name  = string #(Required) resource group name for the user assigned identity
    container_group_key_vault_name                              = string #(Required) key valut for the continer for key valut key id
    container_group_key_vault_resource_group_name               = string #(Required) key valut resource group name
    container_group_is_subnet_required                          = bool   #(Optional) The subnet resource IDs for a container group. Changing this forces a new resource to be created.
    container_group_subnet_name                                 = string #(Optional) subnet name should be pass when is subnet required is true
    container_group_vnet_name                                   = string #(Optional) vnet name should be pass when is subnet required is true
    container_group_vnet_resource_group_name                    = string #(Optional)resource group name should be pass when is subnet required is true
    container_group_key_vault_secret_name                       = string #(Optional)key valut secret name for to store the secret fot the key vault key
    container_group_storage_account_name                        = string #(Optional) The Azure storage account from which the volume is to be mounted. Changing this forces a new resource to be created.
    container_group_storage_account_resource_group_name         = string #(Optional) The Azure storage account resource group name from which the volume is to be mounted. Changing this forces a new resource to be created.
    container_group_name                                        = string #(Required)  Specifies the name of the Container Group. Changing this forces a new resource to be created.
    container_group_location                                    = string #(Required) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created.
    container_group_sku                                         = string #(Optional) Specifies the sku of the Container Group. Possible values are Confidential, Dedicated and Standard. Defaults to Standard. Changing this forces a new resource to be created.
    container_group_resource_group_name                         = string #(Required) The name of the resource group in which to create the Container Group. Changing this forces a new resource to be created.
    container_group_ip_address_type                             = string # (Optional) Specifies the IP address type of the container. Public, Private or None. Changing this forces a new resource to be created. If set to Private, subnet_ids also needs to be set.
    container_group_dns_name_label                              = string # (Optional) The DNS label/name for the container group's IP. Changing this forces a new resource to be created.
    container_group_os_type                                     = string #(Required) The OS for the container group. Allowed values are Linux and Windows. Changing this forces a new resource to be created.
    container_group_key_vault_key_id_enabled                    = bool   #(Required) The Key Vault key URI for CMK encryption. Changing this forces a new resource to be created.
    container_group_key_vault_user_assigned_identity_id_enabled = bool   #(Required)The user assigned identity that has access to the Key Vault Key. If not specified, the RP principal named "Azure Container Instance Service" will be used instead. Make sure the identity has the proper key_permissions set, at least with Get, UnwrapKey, WrapKey and GetRotationPolicy.
    container_group_network_profile_id                          = string # (Optional) Network profile ID for deploying to virtual network. 
    container_group_restart_policy                              = string # (Optional) Restart policy for the container group. Allowed values are Always, Never, OnFailure. Defaults to Always. Changing this forces a new resource to be created.
    container_group_generate_new_admin_password                 = bool   # (optional)continer group admin password
    container_group_key_vault_key_name                          = string #(Optional) key vault key name for the key vault key id
    identity = object({                                                  #An identity block as defined below.
      identity_type = string                                             #(Required) Specifies the type of Managed Service Identity that should be configured on this Container Group. Possible values are SystemAssigned, UserAssigned, SystemAssigned, UserAssigned (to enable both).
      identity_ids  = list(string)                                       # (Optional) Specifies a list of User Assigned Managed Identity IDs to be assigned to this Container Group.
    })
    init_container = object({
      init_container_name                         = string       #(Required) Specifies the name of the Container. Changing this forces a new resource to be created.
      init_container_image                        = string       #(Required) The container image name. Changing this forces a new resource to be created.
      init_container_environment_variables        = map(string)  # (Optional) A list of environment variables to be set on the container. Specified as a map of name/value pairs. Changing this forces a new resource to be created.
      init_container_secure_environment_variables = map(string)  #  (Optional) A list of sensitive environment variables to be set on the container. Specified as a map of name/value pairs. Changing this forces a new resource to be created.
      init_container_commands                     = list(string) # (Optional) A list of commands which should be run on the container. Changing this forces a new resource to be created.
      volume = object({                                          # (Optional) The definition of a volume mount for this container as documented in the
        volume_name                 = string                     # (Required) The name of the volume mount. Changing this forces a new resource to be created.
        volume_mount_path           = string                     # (Required) The path on which this volume is to be mounted. Changing this forces a new resource to be created.
        volume_read_only            = bool                       #(Optional) Specify if the volume is to be mounted as read only or not. The default value is false. Changing this forces a new resource to be created.
        volume_empty_dir            = bool                       # (Optional) Boolean as to whether the mounted volume should be an empty directory. Defaults to false. Changing this forces a new resource to be created.
        volume_storage_account_name = string                     # (Optional) The Azure storage account from which the volume is to be mounted. Changing this forces a new resource to be created.
        volume_storage_account_key  = string                     #(Optional) The access key for the Azure Storage account specified as above. Changing this forces a new resource to be created.
        volume_share_name           = string                     # (Optional) The Azure storage share that is to be mounted as a volume. This must be created on the storage account specified as above. Changing this forces a new resource to be created.
        volume_secret               = map(string)                #(Optional) A map of secrets that will be mounted as files in the volume. Changing this forces a new resource to be created.
        git_repo = object({                                      # (Optional) A git_repo block as defined below.
          git_repo_url       = string                            # (Required) Specifies the Git repository to be cloned. Changing this forces a new resource to be created.
          git_repo_directory = string                            # (Optional) Specifies the directory into which the repository should be cloned. Changing this forces a new resource to be created.
          git_repo_revision  = string                            # (Optional) Specifies the commit hash of the revision to be cloned. If unspecified, the HEAD revision is cloned. Changing this forces a new resource to be created.
        })
      })
      security = object({        #(Optional) The definition of the security context for this container as documented in the security block below. Changing this forces a new resource to be created.
        privilege_enabled = bool #(Required) Whether the container's permission is elevated to privileged? Changing this forces a new resource to be created.
      })
    })
    dns_config = object({                      # (Optional) A dns_config block as documented below.
      dns_config_nameservers    = list(string) # (Required) A list of nameservers the containers will search out to resolve requests.
      dns_config_search_domains = list(string) #(Optional) A list of search domains that DNS requests will search along.
      dns_config_options        = list(string) # (Optional) A list of resolver configuration options.
    })
    diagnostics = object({     #(Optional) A diagnostics block as documented below.
      log_analytics = object({ # (Required) A log_analytics block as defined below. Changing this forces a new resource to be created.
        log_type = string      #- (Optional) The log type which should be used. Possible values are ContainerInsights and ContainerInstanceLogs. Changing this forces a new resource to be created.
        metadata = map(string) # (Optional) Any metadata required for Log Analytics. Changing this forces a new resource to be created.
      })
    })
    exposed_port = object({          # (Optional) Zero or more exposed_port blocks as defined below. Changing this forces a new resource to be created.
      exposed_port          = number #(Required) The port number the container will expose. Changing this forces a new resource to be created.
      exposed_port_protocol = string # (Required) The network protocol associated with port. Possible values are TCP & UDP. Changing this forces a new resource to be created.
    })
    image_registry_credential = object({          # (Optional) An image_registry_credential block as documented below. Changing this forces a new resource to be created.
      image_registry_credential_username = string #(Optional) The username with which to connect to the registry. Changing this forces a new resource to be created.
      image_registry_credential_password = string #(Optional) The password with which to connect to the registry. Changing this forces a new resource to be created.
      image_registry_credential_server   = string # (Required) The address to use to connect to the registry without protocol ("https"/"http"). For example: "myacr.acr.io". Changing this forces a new resource to be created.
    })
    container = object({                                    # (Required) The definition of a container that is part of the group as documented in the container block below. Changing this forces a new resource to be created.
      container_name                         = string       #(Required) Specifies the name of the Container. Changing this forces a new resource to be created.
      container_image                        = string       # (Required) The container image name. Changing this forces a new resource to be created.
      container_cpu                          = string       #- (Required) The required number of CPU cores of the containers. Changing this forces a new resource to be created.
      container_memory                       = string       # (Required) The required memory of the containers in GB. Changing this forces a new resource to be created.
      cpu_limit                              = string       # (Optional) The upper limit of the number of CPU cores of the containers.
      memory_limit                           = string       #(Optional) The the upper limit of the memory of the containers in GB.
      container_environment_variables        = map(string)  #(Optional) A list of environment variables to be set on the container. Specified as a map of name/value pairs. Changing this forces a new resource to be created.
      container_secure_environment_variables = map(string)  # (Optional) A list of sensitive environment variables to be set on the container. Specified as a map of name/value pairs. Changing this forces a new resource to be created.
      container_commands                     = list(string) # (Optional) A list of commands which should be run on the container. Changing this forces a new resource to be created.
      gpu = object({                                        # (Optional) A gpu block as defined below. Changing this forces a new resource to be created.
        gpu_count = number                                  #(Optional) The number of GPUs which should be assigned to this container. Allowed values are 1, 2, or 4. Changing this forces a new resource to be created.
        gpu_sku   = string                                  # (Optional) The SKU which should be used for the GPU. Possible values are K80, P100, or V100. Changing this forces a new resource to be created.
      })
      gpu_limit = object({       # (Optional) A gpu_limit block as defined below.
        gpu_limit_count = number #(Optional) The upper limit of the number of GPUs which should be assigned to this container.
        gpu_limit_sku   = string # (Optional) The allowed SKU which should be used for the GPU. Possible values are K80, P100, or V100.
      })
      readiness_probe = object({
        readiness_probe_exec                  = list(string) #(Optional) Commands to be run to validate container readiness. Changing this forces a new resource to be created.
        readiness_probe_initial_delay_seconds = number       # (Optional) The definition of the http_get for this container as documented in the http_get block below. Changing this forces a new resource to be created.
        readiness_probe_period_seconds        = number       # (Optional) Number of seconds after the container has started before liveness or readiness probes are initiated. Changing this forces a new resource to be created.
        readiness_probe_failure_threshold     = number       #Optional) How many times to try the probe before restarting the container (liveness probe) or marking the container as unhealthy (readiness probe). The default value is 3 and the minimum value is 1. Changing this forces a new resource to be created.
        readiness_probe_success_threshold     = number       #(Optional) Minimum consecutive successes for the probe to be considered successful after having failed. The default value is 1 and the minimum value is 1. Changing this forces a new resource to be created.
        readiness_probe_timeout_seconds       = number       #(Optional) Number of seconds after which the probe times out. The default value is 1 and the minimum value is 1. Changing this forces a new resource to be created.
        http_get = object({                                  # (Optional) The definition of the http_get for this container as documented in the http_get block below. Changing this forces a new resource to be created.
          http_get_path   = string                           # (Optional) Path to access on the HTTP server. Changing this forces a new resource to be created.
          http_get_port   = number                           # (Optional) Number of the port to access on the container. Changing this forces a new resource to be created.
          http_get_scheme = string                           # (Optional) Scheme to use for connecting to the host. Possible values are Http and Https. Changing this forces a new resource to be created.
        })
      })
      liveness_probe = object({                             # (Optional) The definition of a readiness probe for this container as documented in the liveness_probe block below. Changing this forces a new resource to be created.
        liveness_probe_exec                  = list(string) # (Optional) Commands to be run to validate container readiness. Changing this forces a new resource to be created.
        liveness_probe_initial_delay_seconds = number       # (Optional) Number of seconds after the container has started before liveness or readiness probes are initiated. Changing this forces a new resource to be created.
        liveness_probe_period_seconds        = number       # (Optional) How often (in seconds) to perform the probe. The default value is 10 and the minimum value is 1. Changing this forces a new resource to be created.
        liveness_probe_failure_threshold     = number       # (Optional) How many times to try the probe before restarting the container (liveness probe) or marking the container as unhealthy (readiness probe). The default value is 3 and the minimum value is 1. Changing this forces a new resource to be created.
        liveness_probe_success_threshold     = number       # (Optional) Minimum consecutive successes for the probe to be considered successful after having failed. The default value is 1 and the minimum value is 1. Changing this forces a new resource to be created.
        liveness_probe_timeout_seconds       = number       # (Optional) Number of seconds after which the probe times out. The default value is 1 and the minimum value is 1. Changing this forces a new resource to be created.
        http_get = object({                                 #(Optional) The definition of the http_get for this container as documented in the http_get block below. Changing this forces a new resource to be created.
          http_get_path   = string                          # (Optional) Path to access on the HTTP server. Changing this forces a new resource to be created.
          http_get_port   = number                          # (Optional) Number of the port to access on the container. Changing this forces a new resource to be created.
          http_get_scheme = string                          #(Optional) Scheme to use for connecting to the host. Possible values are Http and Https. Changing this forces a new resource to be created.
        })
      })
      volume = object({                           #(Optional) The definition of a volume mount for this container as documented in the volume block below. Changing this forces a new resource to be created.
        volume_name                 = string      # (Required) The name of the volume mount. Changing this forces a new resource to be created.
        volume_mount_path           = string      # (Required) The path on which this volume is to be mounted. Changing this forces a new resource to be created.
        volume_read_only            = bool        #(Optional) Specify if the volume is to be mounted as read only or not. The default value is false. Changing this forces a new resource to be created.
        volume_empty_dir            = bool        # (Optional) Boolean as to whether the mounted volume should be an empty directory. Defaults to false. Changing this forces a new resource to be created.
        volume_storage_account_name = string      # (Optional) The Azure storage account from which the volume is to be mounted. Changing this forces a new resource to be created.
        volume_storage_account_key  = string      #(Optional) The access key for the Azure Storage account specified as above. Changing this forces a new resource to be created.
        volume_share_name           = string      # (Optional) The Azure storage share that is to be mounted as a volume. This must be created on the storage account specified as above. Changing this forces a new resource to be created.
        volume_secret               = map(string) # (Optional) A map of secrets that will be mounted as files in the volume. Changing this forces a new resource to be created.
        git_repo = object({
          git_repo_url       = string # (Required) Specifies the Git repository to be cloned. Changing this forces a new resource to be created.
          git_repo_directory = string #(Optional) Specifies the directory into which the repository should be cloned. Changing this forces a new resource to be created.
          git_repo_revision  = string #(Optional) Specifies the commit hash of the revision to be cloned. If unspecified, the HEAD revision is cloned. Changing this forces a new resource to be created.
        })
      })
      security = object({        #(Optional) The definition of the security context for this container as documented in the security block below. Changing this forces a new resource to be created.
        privilege_enabled = bool #(Required) Whether the container's permission is elevated to privileged? Changing this forces a new resource to be created.
      })
      ports = object({          # (Optional) A set of public ports for the container. Changing this forces a new resource to be created. Set as documented in the ports block below.
        port           = number #(Required) The port number the container will expose. Changing this forces a new resource to be created.
        ports_protocol = string #(Required) The network protocol associated with port. Possible values are TCP & UDP. Changing this forces a new resource to be created.
      })
    })
    container_group_tags = map(string) # map of tages for the continer group.
  }))
  default     = {}
  description = "Map of object of Container Group variables"
}
