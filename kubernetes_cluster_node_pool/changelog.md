# Kubernetes Node Pool Module Change Log

## Kubernetes node pool module v1.1.0 features and bug fixes:

1. Updated for_each object reference
2. Tested compatibility with azure_rm 3.9.0
3. Tested compatibility with Terraform version 1.1.7
4. Multiple Node Pools are only supported when the Kubernetes Cluster is using Virtual Machine Scale Sets.
5. A Windows Node Pool cannot have a name longer than 6 characters.
6. The type of Default Node Pool for the Kubernetes Cluster must be VirtualMachineScaleSets to attach multiple node pools.
7. When setting kubernetes_cluster_node_pool_priority to Spot - you must configure an kubernetes_cluster_node_pool_eviction_policy, kubernetes_cluster_node_pool_spot_max_price and add the applicable kubernetes_cluster_node_pool_node_labels and kubernetes_cluster_node_pool_node_taints
8. At this time there's a bug in the AKS API where Tags for a Node Pool are not stored in the correct case 
9. At this time the Subnet used must be the same for all node pools in the cluster. A route table must be configured on this Subnet.

## Kubernetes node pool module v1.2.0 features and bug fixes:

1. Upgraded the azurerm version to 3.33.0 and terraform v1.3.0
2. Tested by running terraform plan and apply. Module works as expected.
3. All new attributes added in azurerm v3.33.0 which are not present in v3.9.0

## Kubernetes node pool module v1.3.0 features and bug fixes:

1. Upgraded the azurerm version to 3.75.0 and terraform v1.6.2
2. Tested by running terraform plan and apply. Module works as expected.
3. All new attributes added in azurerm v3.75.0 which are not present in v3.33.0
   - Added windows_profile block.
   - Added node_network_profile block.
   - snapshot_id and data block for fetching the ID.
   - custom_ca_trust_enabled