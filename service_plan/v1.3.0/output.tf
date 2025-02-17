# SERVICE PLAN OUTPUT
output "service_plan_output" {
  value = { for k, v in azurerm_service_plan.service_plan : k => {
    id       = v.id
    kind     = v.kind
    reserved = v.reserved
    }
  }
  description = "service plan output values"
}