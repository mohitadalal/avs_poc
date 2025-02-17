#CONTAINER GROUP OUTPUT
output "container_group_output" {
  value       = module.container_group.container_group_output
  description = "The Container Group output values"
}