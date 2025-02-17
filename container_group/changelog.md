# Storage Blob Module Change Log

## container_group module v1.1.0 features and bug fixes:

1. Tested compatibility with azure_rm 3.9.0

## container_group module v1.2.0 features and bug fixes:

1. Tested compatibility with azure_rm 3.33.0
2. Tested compatibility with Terraform version 1.3.6
3. Added details for required and optional parameters
4. new attribute is added subnet_ids if subnet_id required true then subnet name vnetname and resource group name should be passed

## container_group module v1.3.0 features and bug fixes:

1. Tested compatibility with azure_rm 3.75.0
2. Tested compatibility with Terraform version 1.6.2
3. Updated the module with the following new arguments:
    - sku
    - key_vault_user_assigned_identity_id
    - security block in init_container and container blocks 