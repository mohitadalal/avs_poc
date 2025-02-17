#KUBERNETES CLUSTER NODE POOL OUTPUT VALUES
output "kubernetes_cluster_node_pool_output" {
  value       = module.kubernetes_cluster_node_pool.kubernetes_cluster_node_pool_output
  description = "kubernetes cluster node pool output values"
}