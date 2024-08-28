output "kubeconfig" {
  value = module.eks.kubeconfig
  sensitive = true
}

output "cluster_id" {
  value = module.eks.cluster_id
}

output "cluster_endpoint" {
  value = module.eks.cluster_endpoint
}
