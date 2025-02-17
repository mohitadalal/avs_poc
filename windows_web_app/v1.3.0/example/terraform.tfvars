#RESOURCE GROUP FOR WEB APP 
windows_web_app_resource_group_variables = {
  "resource_group_1" = {
    resource_group_name     = "ploceusrg000001" #(Required) Name of the Resource Group with which it should be created.
    resource_group_location = "eastus2"         #(Required) The Azure Region where the Resource Group should exist.
    #(Optional) A mapping of tags which should be assigned to the Resource Group.
    resource_group_managed_by = "ploceus" #(optional)  The ID of the resource or application that manages this Resource Group.
    resource_group_tags = {
      Owner       = "gowtham.nara@neudesic.com",
      Environment = "POC",
    }
  }
}

#RESOURCE GROUP FOR KEY VAULT 
key_vault_resource_group_variables = {
  "resource_group_1" = {
    resource_group_name       = "ploceusrg000002" #(Required) Name of the Resource Group with which it should be created.
    resource_group_location   = "eastus2"         #(Required) The Azure Region where the Resource Group should exist.
    resource_group_managed_by = "ploceus"         #(optional)  The ID of the resource or application that manages this Resource Group.
    #(Optional) A mapping of tags which should be assigned to the Resource Group.
    resource_group_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}

#RESOURCE GROUP FOR STORAGE ACCOUNT 
storage_account_resource_group_variables = {
  "resource_group_1" = {
    resource_group_name       = "ploceusrg000003" #(Required) Name of the Resource Group with which it should be created.
    resource_group_location   = "eastus2"         #(Required) The Azure Region where the Resource Group should exist.
    resource_group_managed_by = "ploceus"         #(optional)  The ID of the resource or application that manages this Resource Group.
    #(Optional) A mapping of tags which should be assigned to the Resource Group.
    resource_group_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}

#VIRTUAL NETWORK 
virtual_network_variables = {
  "virtual_network_1" = {
    virtual_network_name                    = "ploceusvnet000001"         #(Required) The name of the virtual network.
    virtual_network_location                = "eastus"                    #(Required) The location/region where the virtual network is created.
    virtual_network_resource_group_name     = "ploceusrg000001"           #(Required) The name of the resource group in which to create the virtual network.
    virtual_network_address_space           = ["10.1.0.0/16"]             #(Required) The address space that is used the virtual network.
    virtual_network_dns_servers             = null                        #(Optional) List of IP addresses of DNS servers.Since dns_servers can be configured both inline and via the separate azurerm_virtual_network_dns_servers resource, we have to explicitly set it to empty slice ([]) to remove it.
    virtual_network_flow_timeout_in_minutes = null                        #(Optional) The flow timeout in minutes for the Virtual Network, which is used to enable connection tracking for intra-VM flows. Possible values are between 4 and 30 minutes.
    virtual_network_bgp_community           = null                        #(Optional) The BGP community attribute in format <as-number>:<community-value>.The as-number segment is the Microsoft ASN, which is always 12076 for now.
    virtual_network_edge_zone               = null                        #(Optional) Specifies the Edge Zone within the Azure Region where this Virtual Network should exist. Changing this forces a new Virtual Network to be created.
    virtual_network_ddos_protection_plan = {                              #(Optional block) provide true for virtual_network_ddos_protection_enable incase ddos_protection needs to be enabled.
      virtual_network_ddos_protection_enable    = false                   #(Required) Enable/disable DDoS Protection Plan on Virtual Network.
      virtual_network_ddos_protection_plan_name = "ploceusddosplan000001" #(Required) Needed for ddos protection plan id.Provide the name of the ddos protection plan if above enable is true
    }
    virtual_network_encryption = [
      {
        virtual_network_encryption_enforcement = "AllowUnencrypted"
      }
    ]
    virtual_network_subnet = null #(Optional) Can be specified multiple times to define multiple subnets
    virtual_network_tags = {      #(Optional) A mapping of tags which should be assigned to the virtual network.
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}

#SUBNET
subnet_variables = {
  "subnet_1" = {
    subnet_name                                           = "ploceussubnet000001"              # (Required) The name of the subnet. Changing this forces a new resource to be created.
    subnet_resource_group_name                            = "ploceusrg000001"                  #(Required) The name of the resource group in which to create the subnet. Changing this forces a new resource to be created.
    subnet_address_prefixes                               = ["10.1.1.0/24"]                    #(Required) The address prefixes to use for the subnet.
    subnet_virtual_network_name                           = "ploceusvnet000001"                #(Required) The name of the virtual network to which to attach the subnet. Changing this forces a new resource to be created.
    subnet_private_link_service_network_policies_enabled  = null                               # (Optional) Enable or Disable network policies for the private link service on the subnet. Setting this to true will Enable the policy and setting this to false will Disable the policy. Defaults to true.
    subnet_private_endpoint_network_policies_enabled      = null                               # (Optional) Enable or Disable network policies for the private endpoint on the subnet. Setting this to true will Enable the policy and setting this to false will Disable the policy. Defaults to true.
    subnet_enforce_private_link_endpoint_network_policies = null                               #(Optional) Enable or Disable network policies for the private link endpoint on the subnet. Setting this to true will Disable the policy and setting this to false will Enable the policy. Default value is false.
    subnet_enforce_private_link_service_network_policies  = null                               #(Optional) Enable or Disable network policies for the private link service on the subnet. Setting this to true will Disable the policy and setting this to false will Enable the policy. Default value is false.
    subnet_service_endpoint_policy_ids                    = null                               #(Optional) The list of IDs of Service Endpoint Policies to associate with the subnet.
    subnet_service_endpoints                              = ["Microsoft.AzureActiveDirectory"] #(Optional) The list of Service endpoints to associate with the subnet. Possible values include: Microsoft.AzureActiveDirectory, Microsoft.AzureCosmosDB, Microsoft.ContainerRegistry, Microsoft.EventHub, Microsoft.KeyVault, Microsoft.ServiceBus, Microsoft.Sql, Microsoft.Storage and Microsoft.Web.
    delegation = [{
      delegation_name            = "delegation000001"                                                                                                                                                                                                #(Required) A name for this delegation.
      service_delegation_name    = "Microsoft.Sql/managedInstances"                                                                                                                                                                                  # (Required) The name of service to delegate to. Possible values include Microsoft.ApiManagement/service, Microsoft.AzureCosmosDB/clusters, Microsoft.BareMetal/AzureVMware, Microsoft.BareMetal/CrayServers, Microsoft.Batch/batchAccounts, Microsoft.ContainerInstance/containerGroups, Microsoft.ContainerService/managedClusters, Microsoft.Databricks/workspaces, Microsoft.DBforMySQL/flexibleServers, Microsoft.DBforMySQL/serversv2, Microsoft.DBforPostgreSQL/flexibleServers, Microsoft.DBforPostgreSQL/serversv2, Microsoft.DBforPostgreSQL/singleServers, Microsoft.HardwareSecurityModules/dedicatedHSMs, Microsoft.Kusto/clusters, Microsoft.Logic/integrationServiceEnvironments, Microsoft.LabServices/labplans,Microsoft.MachineLearningServices/workspaces, Microsoft.Netapp/volumes, Microsoft.Network/managedResolvers, Microsoft.Orbital/orbitalGateways, Microsoft.PowerPlatform/vnetaccesslinks, Microsoft.ServiceFabricMesh/networks, Microsoft.Sql/managedInstances, Microsoft.Sql/servers, Microsoft.StoragePool/diskPools, Microsoft.StreamAnalytics/streamingJobs, Microsoft.Synapse/workspaces, Microsoft.Web/hostingEnvironments, Microsoft.Web/serverFarms, NGINX.NGINXPLUS/nginxDeployments and PaloAltoNetworks.Cloudngfw/firewalls.
      service_delegation_actions = ["Microsoft.Network/virtualNetworks/subnets/join/action", "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action", "Microsoft.Network/virtualNetworks/subnets/unprepareNetworkPolicies/action"] #(Optional) A list of Actions which should be delegated. This list is specific to the service to delegate to. Possible values include Microsoft.Network/publicIPAddresses/read,Microsoft.Network/virtualNetworks/read,Microsoft.Network/networkinterfaces/*, Microsoft.Network/virtualNetworks/subnets/action, Microsoft.Network/virtualNetworks/subnets/join/action, Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action and Microsoft.Network/virtualNetworks/subnets/unprepareNetworkPolicies/action.
    }]
  }
}

#KEY VAULT
key_vault_variables = {
  "key_vault_1" = {
    key_vault_name                                  = "ploceuskv000001"                                                                                                                                                                               #(Required) Specifies the name of the Key Vault, The name must be globally unique.
    key_vault_location                              = "eastus2"                                                                                                                                                                                       #(Required) Specifies the supported Azure location where the resource exists.
    key_vault_resource_group_name                   = "ploceusrg000002"                                                                                                                                                                               #(Required) The name of the resource group in which to create the Key Vault.
    key_vault_enabled_for_disk_encryption           = true                                                                                                                                                                                            #(Optional) Boolean flag to specify whether Azure Disk Encryption is permitted to retrieve secrets from the vault and unwrap keys. Defaults to false.
    key_vault_enabled_for_deployment                = true                                                                                                                                                                                            #(Optional) Boolean flag to specify whether Azure Virtual Machines are permitted to retrieve certificates stored as secrets from the key vault. Defaults to false
    key_vault_enabled_for_template_deployment       = true                                                                                                                                                                                            # (Optional) Boolean flag to specify whether Azure Resource Manager is permitted to retrieve secrets from the key vault. Defaults to false.
    key_vault_enable_rbac_authorization             = false                                                                                                                                                                                           #(Optional) Boolean flag to specify whether Azure Key Vault uses Role Based Access Control (RBAC) for authorization of data actions. Defaults to false.
    key_vault_soft_delete_retention_days            = "7"                                                                                                                                                                                             #(Optional) The number of days that items should be retained for once soft-deleted. This value can be between 7 and 90 (the default) days.
    key_vault_purge_protection_enabled              = false                                                                                                                                                                                           #(Optional) Is Purge Protection enabled for this Key Vault? Defaults to false.
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

#KEY VAULT ACCESS POLICY
key_vault_access_policy_variables = {
  "key_vault_access_policy_1" = {
    key_vault_access_policy_key_permissions         = ["Get", "List", "Create", "Delete", "Recover", "Backup", "Restore", "Purge", "Update", "GetRotationPolicy", "SetRotationPolicy"]                                                                #(Optional) List of key permissions, must be one or more from the following: Backup, Create, Decrypt, Delete, Encrypt, Get, Import, List, Purge, Recover, Restore, Sign, UnwrapKey, Update, Verify, WrapKey, Release, Rotate, GetRotationPolicy, and SetRotationPolicy.
    key_vault_access_policy_secret_permissions      = ["Get", "List", "Delete", "Recover", "Backup", "Restore", "Purge", "Set"]                                                                                                                       #(Optional) List of secret permissions, must be one or more from the following: Backup, Delete, Get, List, Purge, Recover, Restore and Set.
    key_vault_access_policy_storage_permissions     = []                                                                                                                                                                                              #(Optional) List of storage permissions, must be one or more from the following: Backup, Delete, DeleteSAS, Get, GetSAS, List, ListSAS, Purge, Recover, RegenerateKey, Restore, Set, SetSAS and Update.
    key_vault_access_policy_certificate_permissions = ["Backup", "Create", "Delete", "DeleteIssuers", "Get", "GetIssuers", "Import", "List", "ListIssuers", "ManageContacts", "ManageIssuers", "Purge", "Recover", "Restore", "SetIssuers", "Update"] #(Optional) List of certificate permissions, must be one or more from the following: Backup, Create, Delete, DeleteIssuers, Get, GetIssuers, Import, List, ListIssuers, ManageContacts, ManageIssuers, Purge, Recover, Restore, SetIssuers and Update.
    key_vault_name                                  = "ploceuskv000001"                                                                                                                                                                               #(Required) Specifies the name of the Key Vault resource.
    key_vault_resource_group_name                   = "ploceusrg000002"                                                                                                                                                                               #(Required) Specifies the resource group name where the key vault resides in.
    key_vault_access_resource_name                  = "user@ploceus.com"                                                                                                                                                                              #"XXXXXXXXXXX@ploceus.com"                                                                                                                                                                       #(Required) Specifies the resource name that needs an access policy to the key vault. Possible values are username, group name, service principal name and application name
    key_vault_access_resource_type                  = "User"                                                                                                                                                                                          #(Required) Specifies the type of resource that needs the access policy to the key vault. Possible values are User, SPN, Group, Application
  }
}

#KEY VAULT SECRET
key_vault_secret_variables = {
  "key_vault_secret_1" = {
    key_vault_name                       = "ploceuskv000001"             #(Required) Specifies the name of the Key Vault.
    key_vault_secret_value               = "ploceusvalue000001"          #(Required) Specifies the value of the Key Vault Secret
    key_vault_secret_content_type        = ""                            #(Optional) Specifies the content type for the Key Vault Secret
    key_vault_secret_not_before_date     = null                          #(Optional) Specifies that the key is not usable before the provided UTC datetime (Y-m-d'T'H:M:S'Z'), value format example "1982-12-11T00:00:00Z"
    key_vault_secret_expiration_date     = null                          #(Optional) Specifies the expiration UTC datetime (Y-m-d'T'H:M:S'Z'), value format example "1982-12-11T00:00:00Z"
    key_vault_secret_resource_group_name = "ploceusrg000002"             #(Required) Specifies the name of the resource group, where the key_vault resides in
    key_vault_secret_name                = "ploceuskeyvaultsecret000001" #(Required) Specifies the name of the Key Vault Secret. Changing this forces a new resource to be created


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
  "key_vault_secret_2" = {
    key_vault_name                       = "ploceuskv000001"                       #(Required) Specifies the name of the Key Vault.
    key_vault_secret_value               = "ploceusvalue000001"                    #(Required) Specifies the value of the Key Vault Secret
    key_vault_secret_content_type        = ""                                      #(Optional) Specifies the content type for the Key Vault Secret
    key_vault_secret_not_before_date     = null                                    #(Optional) Specifies that the key is not usable before the provided UTC datetime (Y-m-d'T'H:M:S'Z'), value format example "1982-12-11T00:00:00Z"
    key_vault_secret_expiration_date     = null                                    #(Optional) Specifies the expiration UTC datetime (Y-m-d'T'H:M:S'Z'), value format example "1982-12-11T00:00:00Z"
    key_vault_secret_resource_group_name = "ploceusrg000002"                       #(Required) Specifies the name of the resource group, where the key_vault resides in
    key_vault_secret_name                = "ploceuskeyvaultconnectionstring000001" #(Required) Specifies the name of the Key Vault Secret. Changing this forces a new resource to be created


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
  "key_vault_secret_3" = {
    key_vault_name                       = "ploceuskv000001"       #(Required) Specifies the name of the Key Vault.
    key_vault_secret_value               = "ploceusvalue000001"    #(Required) Specifies the value of the Key Vault Secret
    key_vault_secret_content_type        = ""                      #(Optional) Specifies the content type for the Key Vault Secret
    key_vault_secret_not_before_date     = null                    #(Optional) Specifies that the key is not usable before the provided UTC datetime (Y-m-d'T'H:M:S'Z'), value format example "1982-12-11T00:00:00Z"
    key_vault_secret_expiration_date     = null                    #(Optional) Specifies the expiration UTC datetime (Y-m-d'T'H:M:S'Z'), value format example "1982-12-11T00:00:00Z"
    key_vault_secret_resource_group_name = "ploceusrg000002"       #(Required) Specifies the name of the resource group, where the key_vault resides in
    key_vault_secret_name                = "ploceusadsecret000001" #(Required) Specifies the name of the Key Vault Secret. Changing this forces a new resource to be created


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

#STORAGE ACCOUNT
storage_account_variables = {
  "storage_account_1" = {
    storage_account_key_vault_name                                     = null              #(Required) The name of the Key Vault.
    storage_account_is_key_vault_key_versionless                       = false             #(Optional) Specifies the ID of the Key Vault Key should be version less or specific key version should be assigned, supplying a version-less key ID will enable auto-rotation of this key
    storage_account_key_vault_resource_group_name                      = null              #(Required) The resource group name of the Key Vault.
    storage_account_key_vault_key_name                                 = null              #(Required) The name of the Key Vault key required for customer managed key.
    storage_account_user_assigned_identity_name_for_cmk                = null              #(Required) The name of a user assigned identity for customer managed key.
    storage_account_user_assigned_identity_resource_group_name_for_cmk = null              #(Required) The resource group name of a user assigned identity for customer managed key.
    storage_account_identity_type_for_cmk                              = null              #(Required) The identity type of a user assigned identity for customer managed key.Only Possible value could be "UserAssigned" in order to use customer managed key. Other Possible values are "SystemAssigned", "SystemAssigned, UserAssigned"
    storage_account_name                                               = "ploceussa000001" #(Required) Specifies the name of the storage account. Only lowercase Alphanumeric characters allowed.This must be unique across the entire Azure service, not just within the resource group.
    storage_account_resource_group_name                                = "ploceusrg000003" #(Required) The name of the resource group in which to create the storage account.
    storage_account_location                                           = "eastus"          #(Required) Specifies the supported Azure location where the resource exists.
    storage_account_account_kind                                       = "StorageV2"       #(Optional) Defines the Kind of account. Valid options are BlobStorage, BlockBlobStorage, FileStorage, Storage and StorageV2. Defaults to StorageV2.
    storage_account_account_tier                                       = "Standard"        #(Required) Defines the Tier to use for this storage account. Valid options are Standard and Premium. For BlockBlobStorage and FileStorage accounts only Premium is valid.
    storage_account_account_replication_type                           = "LRS"             #(Required) Defines the type of replication to use for this storage account. Valid options are LRS, GRS, RAGRS, ZRS, GZRS and RAGZRS. Changing this forces a new resource to be created when types LRS, GRS and RAGRS are changed to ZRS, GZRS or RAGZRS and vice versa.
    storage_account_cross_tenant_replication_enabled                   = true              #(Optional) Should cross Tenant replication be enabled? Defaults to true.
    storage_account_access_tier                                        = "Hot"             #(Optional) Defines the access tier for BlobStorage, FileStorage and StorageV2 accounts. Valid options are Hot and Cool, defaults to Hot.
    storage_account_edge_zone                                          = null              #(Optional) Specifies the Edge Zone within the Azure Region where this Storage Account should exist.
    storage_account_enable_https_traffic_only                          = true              #(Optional) Boolean flag which forces HTTPS if enabled. Defaults to true.
    storage_account_min_tls_version                                    = "TLS1_2"          #(Optional) The minimum supported TLS version for the storage account. Possible values are TLS1_0, TLS1_1, and TLS1_2. Defaults to TLS1_2 for new storage accounts.
    storage_account_allow_nested_items_to_be_public                    = true              #Allow or disallow nested items within this Account to opt into being public. Defaults to true.
    storage_account_shared_access_key_enabled                          = true              #Indicates whether the storage account permits requests to be authorized with the account access key via Shared Key. If false, then all requests, including shared access signatures, must be authorized with Azure Active Directory (Azure AD). The default value is true.
    storage_account_public_network_access_enabled                      = true              #(Optional) Whether the public network access is enabled? Defaults to true.
    storage_account_default_to_oauth_authentication                    = false             #(Optional) Default to Azure Active Directory authorization in the Azure portal when accessing the Storage Account. The default value is false
    storage_account_is_hns_enabled                                     = false             #(Optional) Is Hierarchical Namespace enabled? This can be used with Azure Data Lake Storage Gen 2.
    storage_account_nfsv3_enabled                                      = false             #(Optional) Is NFSv3 protocol enabled? Defaults to false.
    storage_account_large_file_share_enabled                           = false             #(Optional) Is Large File Share Enabled?
    storage_account_queue_encryption_key_type                          = "Service"         #(Optional) The encryption type of the queue service. Possible values are Service and Account.Default value is Service.
    storage_account_table_encryption_key_type                          = "Service"         #(Optional) The encryption type of the table service. Possible values are Service and Account. Default value is Service.
    storage_account_infrastructure_encryption_enabled                  = false             #(Optional) Is infrastructure encryption enabled? Defaults to false.
    storage_account_allowed_copy_scope                                 = null              #(Optional) Restrict copy to and from Storage Accounts within an AAD tenant or with Private Links to the same VNet. Possible values are AAD and PrivateLink.
    storage_account_sftp_enabled                                       = false             #(Optional) Boolean, enable SFTP for the storage account, to enable this, is_hns_enabled should be true as well
    storage_account_custom_domain                                      = null
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
    #     identity_resource_group_name = "loceusrg000005"
    #   }]
    # }

    storage_account_blob_properties = {
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
      restore_policy = {
        restore_policy_days = "4" #(Required) Specifies the number of days that the blob can be restored, between 1 and 365 days. This must be less than the days specified for delete_retention_policy.
      }
      delete_retention_policy = {
        delete_retention_policy_days = "7" #(Optional) Specifies the number of days that the blob should be retained, between 1 and 365 days. Defaults to 7.
      }

      container_delete_retention_policy = {
        container_delete_retention_policy_days = "7" #(Optional) Specifies the number of days that the container should be retained, between 1 and 365 days. Defaults to 7.
      }
    }

    storage_account_queue_properties = {
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
    }

    storage_account_static_website = {
      index_document     = "index.html" #Optional) The webpage that Azure Storage serves for requests to the root of a website or any subfolder. For example, index.html. The value is case-sensitive.
      error_404_document = "404.html"   #(Optional) The absolute path to a custom webpage that should be used when a request is made which does not correspond to an existing file.
    }

    storage_account_share_properties = {
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
    }

    storage_account_network_rules = null /* {
      default_action = "Deny"                 #(Required) Specifies the default action of allow or deny when no other rules match. Valid options are Deny or Allow.
      bypass         = ["Logging", "Metrics"] #(Optional) Specifies whether traffic is bypassed for Logging/Metrics/AzureServices. Valid options are any combination of Logging, Metrics, AzureServices, or None.
      ip_rules       = ["8.29.228.191"]        #(Optional) List of public IP or IP ranges in CIDR Format. Only IPv4 addresses are allowed. Private IP address ranges (as defined in RFC 1918) are not allowed.
      storage_account_network_rules_vnet_subnets = [{
        storage_account_network_rules_virtual_network_name = "ploceusvnet000001"                   #(Required) Vitural Network name to be associated.
        storage_account_network_rules_subnet_name          = "ploceussubnet000001"                 #(Required) Subnet Name to be associated.
        storage_account_network_rules_vnet_subscription_id = "xxxxxxx-xxxxxxx-xxxxxxxxx-xxxxxxxxx" #(Required) Subscription Id where Vnet is created.
        storage_account_network_rules_vnet_rg_name         = "ploceusrg000001"                     #(Required) Resource group where Vnet is created.
        }]
      private_link_access = null /*{
        "private_link_access_1" = {
          endpoint_resource_id = "/subscriptions/XXXXXXXXXXXXXXXXXXXXXXX/resourceGroups/XXXXXXXXXXXXXXXXXXXX/providers/Microsoft.Sql/servers/XXXXXXXXXXXXXXXXXXXX"
          endpoint_tenant_id   = "xxxxxxxxx-xxxxxxxxx-xxxxxxxxxx-xxxxxxxxx"
        }
      }
    } */

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

#USER ASSIGNED IDENTITY
user_assigned_identity_variables = {
  "user_assigned_identity_1" = {
    user_assigned_identity_name                = "ploceusuai000001" #(Required) Specifies the name of this User Assigned Identity. Changing this forces a new User Assigned Identity to be created.
    user_assigned_identity_location            = "eastus2"          # (Required) The Azure Region where the User Assigned Identity should exist. Changing this forces a new User Assigned Identity to be created.
    user_assigned_identity_resource_group_name = "ploceusrg000001"  #Required) Specifies the name of the Resource Group within which this User Assigned Identity should exist. Changing this forces a new User Assigned Identity to be created.
    #(Optional) A mapping of tags which should be assigned to the User Assigned Identity.
    user_assigned_identity_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    } #(Optional) A mapping of tags which should be assigned to the User Assigned Identity.
  }
}

#SERVICE PLAN
service_plan_variables = {
  "service_plan_1" = {
    service_plan_name                         = "ploceusappplan000001" #(Required) The name which should be used for this Service Plan. Changing this forces a new AppService to be created.
    service_plan_location                     = "eastus2"              #(Required) The Azure Region where the Service Plan should exist. Changing this forces a new AppService to be created.
    service_plan_os_type                      = "Windows"              #(Required) The O/S type for the App Services to be hosted in this plan. Possible values include Windows, Linux, and WindowsContainer.
    service_plan_resource_group_name          = "ploceusrg000001"      #(Required) The name of the Resource Group where the AppService should exist. Changing this forces a new AppService to be created.
    service_plan_sku_name                     = "P1v2"                 #(Required) The SKU for the plan. Possible values include B1, B2, B3, D1, F1, I1, I2, I3, I1v2, I2v2, I3v2, P1v2, P2v2, P3v2, P1v3, P2v3, P3v3, S1, S2, S3, SHARED, EP1, EP2, EP3, WS1, WS2, WS3, and Y1.
    service_plan_maximum_elastic_worker_count = null                   #(Optional) The maximum number of workers to use in an Elastic SKU Plan. Cannot be set unless using an Elastic SKU.
    service_plan_worker_count                 = null                   #(Optional) The number of Workers (instances) to be allocated.
    service_plan_per_site_scaling_enabled     = false                  #(Optional) Should Per Site Scaling be enabled. Defaults to false.
    service_plan_zone_balancing_enabled       = false                  #(Optional) Should the Service Plan balance across Availability Zones in the region. Defaults to false.
    service_plan_tags = {                                              #(Optional) A mapping of tags which should be assigned to the AppService.
      Owner       = "gowtham.nara@neudesic.com",
      Environment = "POC",
    }
    service_plan_app_service_environment_name                   = null #(Optional) To fetch The ID of the App Service Environment to create this Service Plan in. If this value present service_plan_app_service_environment_v3_name & service_plan_app_service_environment_v3_resource_group_name must be null.
    service_plan_app_service_environment_resource_group_name    = null #(Optional) To fetch The ID of the App Service Environment to create this Service Plan in. If this value present service_plan_app_service_environment_v3_name & service_plan_app_service_environment_v3_resource_group_name must be null.
    service_plan_app_service_environment_v3_name                = null #(Optional) To fetch The ID of the App Service Environment V3 to create this Service Plan in. If this value present service_plan_app_service_environment_name & service_plan_app_service_environment_resource_group_name must be null.
    service_plan_app_service_environment_v3_resource_group_name = null #(Optional) To fetch The ID of the App Service Environment V3 to create this Service Plan in. If this value present service_plan_app_service_environment_name & service_plan_app_service_environment_resource_group_name must be null.
  }
}

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