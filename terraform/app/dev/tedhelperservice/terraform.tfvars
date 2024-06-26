ecs_cluster_name = "tedhelperservice-dev-cluster"
cpu = "512"
memory = "2048"
ecs_task_definition_family = "tedhelperservice"
ecr_repo_names = ["tedhelperservice-dev-repo", "tedsimulatorservice-dev-repo"]
ecs_cluster_tag_name = "tedhelperservice-dev-cluster"
ecs_cluster_app_name = "tedhelperservice"
environment = "dev"
tedhelper-container_definition_file_path = "./tedhelper-container-definition-dev.json"
tedsimulator-container_definition_file_path = "./tedsimulator-container-definition-dev.json"
operating_system_family = "LINUX"
cpu_architecture = "ARM64"
subnets_for_ecs_service = ["10.1.1.0/24", "10.1.2.0/24"]
tedhelper_container_name = "tedHelperService"
tedhelper_container_port = 8050
tedsimulator_container_name = "ted-simulator"
tedsimulator_container_port = 3000