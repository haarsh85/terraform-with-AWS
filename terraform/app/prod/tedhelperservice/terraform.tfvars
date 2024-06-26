ecr_repo_names = ["tedhelperservice-prod-repo", "tedsimulatorservice-prod-repo"]
environment = "prod"
ecs_cluster_name = "tedhelperservice-prod-cluster"
ecs_cluster_tag_name = "tedhelperservice-prod-cluster"
ecs_cluster_app_name = "tedhelperservice"
tedhelper-container_definition_file_path = "./tedhelper-container-definition-prod.json"
tedsimulator-container_definition_file_path = "./tedsimulator-container-definition-prod.json"
cpu = "512"
memory = "2048"
operating_system_family = "LINUX"
cpu_architecture = "ARM64"
ecs_service_name = "tedhelper-prod-ecs-service"