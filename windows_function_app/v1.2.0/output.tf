output "windows_function_app_output" {
  description = "windows function app output values"
  value = { for k, v in azurerm_windows_function_app.windows_function_app : k => {
    id               = v.id
    default_hostname = v.default_hostname
    identity         = v.identity
    kind             = v.kind
    }
  }
}