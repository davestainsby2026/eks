output "cluster_name" {
  description = "EKS cluster name"
  value       = module.eks.cluster_name
}

output "cluster_endpoint" {
  description = "EKS cluster endpoint"
  value       = module.eks.cluster_endpoint
}

output "kubeconfig_certificate_authority_data" {
  description = "Certificate authority data for kubeconfig"
  value       = module.eks.cluster_certificate_authority_data
}

output "node_group_arn" {
  description = "ARN of the default node group"
  value       = module.eks.eks_managed_node_groups["default"].arn
}
