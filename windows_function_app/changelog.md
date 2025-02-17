# Azure Windows Function App  Module Change Log

## Windows function app module v1.1.0 features and bug fixes:

1. Updated for_each object reference
2. Tested compatibility with azure_rm provider version 3.9
3. Tested compatibility with Terraform version 1.2.8
4. One of "storage_account_access_key" or "storage_uses_managed_identity" must be specified when using "storage_account_name".
5. The optional argument "storage_uses_managed_identity" has been removed beacuse when it is enabled the app_keys for function app are not populated in the portal when infra is up.
6. Function App Keys will not be populated for runtime versions other than "dotnet" .
7. storage_key_vault_secret_id cannot be used with storage_account_name.
8. daily_memory_time_quota - Setting this value only affects function apps under the consumption plan. we do not have an option to select a consumption plan for app service plan .
9. auto_swap_slot argument has been removed , because in v 3.9.0 terraform gives an error as :- "This argument is not expected here."

## Windows Function App module v1.2.0 features and bug fixes:
1. Upgraded the azurerm version to 3.33.0 and terraform v1.3.0
2. Tested by running terraform plan and apply. Module works as expected.
3. Some attributes added in azurerm v3.33.0 are different than azurerm v3.9.0
4. Few code changes have been made in code for v1.2.0 as compared to v1.1.0 
        - Modified locals object and added new logic to code.
        - Added provider aliases for api_management , user_assigned_identity.
        - Added data blocks for api_management_api
        - function app resource contains new storage_account object.

## Windows Function App module v1.3.0 features and bug fixes:
1. Upgraded the azurerm version to 3.75.0 and terraform v1.6.2
2. Tested by running terraform plan and apply. Module works as expected.
3. Some attributes added in azurerm v3.75.0 are different than azurerm v3.33.0
4. New attributes are added listed below.
    1. windows_function_app_auth_settings_v2
    2. public_network_access_enabled
    3. storage_key_vault_secret_id
    4. zip_deploy_file