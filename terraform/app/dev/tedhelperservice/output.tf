output "tedhelperservice_ecr_repo_urls" {
  value = module.tedhelperservice-dev-ecr-repo.ecr_repo_urls
}

output "tedhelperservice_ecs_cluster_name" {
    value = module.tedhelperservice-dev-ecs-cluster.ecs_cluster_name
}

output "tedhelperservice_ecs_cluster_id" {
    value = module.tedhelperservice-dev-ecs-cluster.ecs_cluster_id
}