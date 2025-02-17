# CONTAINER REGISTRY OUTPUT
output "container_registry_output" {
  value = { for k, v in azurerm_container_registry.container_registry : k => {
    id           = v.id
    login_server = v.login_server
    }
  }
  description = "Azure container registry output values"
}
