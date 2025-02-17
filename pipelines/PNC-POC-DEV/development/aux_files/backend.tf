terraform {
  backend "azurerm" {
    resource_group_name  = var.state_file_resource_group_name
    storage_account_name = var.state_file_storage_account
    container_name       = var.state_file_container
    key                  = var.state_file_name
    use_msi              = true
    subscription_id      = var.backend_subscription_id
    tenant_id            = var.backend_tenant_id
  }
}

