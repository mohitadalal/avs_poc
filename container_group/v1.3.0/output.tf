#CONTAINER GROUP OUTPUT
output "container_group_output" {
  description = "The Container Group output values"
  value = { for k, v in azurerm_container_group.container_group : k => {
    id         = v.id
    identity   = v.identity
    ip_address = v.ip_address
    fqdn       = v.fqdn
    }
  }
}