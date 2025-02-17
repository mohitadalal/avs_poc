#CONTAINER REGISTRY
container_registry_variables = {
  "container_registry_1" = {
    container_registry_name                          = "pncpocacr01" #(Required) Specifies the name of the Container Registry. Only Alphanumeric characters allowed. Changing this forces a new resource to be created.
    container_registry_location                      = "eastus"      # (Required) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created.
    container_registry_resource_group_name           = "PNC-POC-RG"  # (Required) The name of the resource group in which to create the Container Registry. Changing this forces a new resource to be created.
    container_registry_sku                           = "Standard"    # (Required) The SKU name of the container registry. Possible values are Basic, Standard and Premium.
    container_registry_admin_enabled                 = true          # (Optional) Specifies whether the admin user is enabled. Defaults to false.
    container_registry_export_policy_enabled         = true          # (Optional) Boolean value that indicates whether export policy is enabled. Defaults to true. In order to set it to false, make sure the public_network_access_enabled is also set to false.
    container_registry_public_network_access_enabled = true          # (Optional) Whether public network access is allowed for the container registry. Defaults to true.
    container_registry_quarantine_policy_enabled     = false         # (Optional) Boolean value that indicates whether quarantine policy is enabled. Defaults to false.
    container_registry_zone_redundancy_enabled       = false         # (Optional) Whether zone redundancy is enabled for this Container Registry? Changing this forces a new resource to be created. Defaults to false.
    container_registry_anonymous_pull_enabled        = false         # (Optional) Whether allows anonymous (unauthenticated) pull access to this Container Registry? Defaults to false. This is only supported on resources with the Standard or Premium SKU.
    container_registry_retention_policy              = null
    container_registry_trust_policy                  = null
    container_registry_georeplication_enabled        = false #(Required) Whether georeplications should be enabled for the container registry.If the this is true, Provide values to georeplications block
    container_registry_georeplications               = null
    container_registry_data_endpoint_enabled         = false           # (Optional) Whether to enable dedicated data endpoints for this Container Registry? Defaults to false. This is only supported on resources with the Premium SKU.
    container_registry_network_rule_bypass_option    = "AzureServices" # (Optional) Whether to allow trusted Azure services to access a network restricted Container Registry? Possible values are None and AzureServices. Defaults to AzureServices.
    container_registry_encryption                    = null
    container_registry_identity = {            #(Optional) Set to null if managed identity configuration is not required.
      identity_type         = "SystemAssigned" # (Required) Specifies the type of Managed Service Identity that should be configured on this Container Registry. Possible values are SystemAssigned, UserAssigned, SystemAssigned, UserAssigned (to enable both).
      identity_identity_ids = null
    }
    container_registry_network_rule_set_enabled = false #(Required) Whether network rule set to be enabled for the container registry. if the value is true, Provide values to container_registry_network_rule_set block.
    container_registry_network_rule_set         = null
    container_registry_tags = { # (Optional) A mapping of tags to assign to the resource.
      Owner       = "gowtham.nara@neudesic.com",
      Environment = "POC",
    }
  }
}
