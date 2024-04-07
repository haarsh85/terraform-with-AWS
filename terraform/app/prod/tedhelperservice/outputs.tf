output "tedhelperservice_ecr_repo_urls" {
  value = module.tedhelperservice-prod-ecr-repo.ecr_repo_urls
}

output "tedhelperservice_ecs_cluster_name" {
    value = module.tedhelperservice-prod-ecs-cluster.ecs_cluster_name
}

output "tedhelperservice_ecs_cluster_id" {
    value = module.tedhelperservice-prod-ecs-cluster.ecs_cluster_id
}