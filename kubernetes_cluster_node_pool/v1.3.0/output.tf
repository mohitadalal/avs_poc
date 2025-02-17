#KUBERNETES CLUSTER NODE POOL OUTPUT VALUES
output "kubernetes_cluster_node_pool_output" {
  value = { for k, v in azurerm_kubernetes_cluster_node_pool.kubernetes_cluster_node_pool : k => {
    id = v.id
    }
  }
  description = "kubernetes cluster node pool output values"
}