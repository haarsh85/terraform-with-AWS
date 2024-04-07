output "providerservice_ecr_repo_urls" {
  value = module.providerservice-dev-ecr-repo.ecr_repo_urls
}

output "providerservice_ecs_cluster_name" {
  value = module.providerservice-dev-ecs-cluster.ecs_cluster_name
}

output "providerservice_ecs_cluster_id" {
  value = module.providerservice-dev-ecs-cluster.ecs_cluster_id
}
