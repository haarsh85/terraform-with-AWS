data "aws_iam_role" "ecs_task_execution_role" {
    name = "ECSTaskExecutionRole"
}

data "aws_iam_role" "ecs_rds_task_role" {
    name = "ECSTaskRoleForRDS"
}

data "aws_ssm_parameter" "dev_mongodb_username" {
    name = "/provider/dev_mongodb_username"
}

data "aws_ssm_parameter" "dev_mongodb_password" {
    name = "/provider/dev_mongodb_password"
}


resource "aws_ecs_task_definition" "provider_mongodb_ecs_task_definition" {
    family                   = var.ecs_task_definition_family
    #container_definitions    = file(var.container_definition_file_path)
    requires_compatibilities = ["FARGATE"]
    network_mode             = "awsvpc"
    cpu                      = var.cpu
    memory                   = var.memory
    execution_role_arn       = data.aws_iam_role.ecs_task_execution_role.arn
    task_role_arn            = data.aws_iam_role.ecs_rds_task_role.arn
    
    runtime_platform {
        operating_system_family = var.operating_system_family
        cpu_architecture        = var.cpu_architecture
    }

    container_definitions = var.fetch_sensitive_info_from_ssm ? jsonencode ([
    {
      name = "providerservice-mongodb",
      image = "mongo:6.0.13-jammy",
      essential = true,
      portMappings = [
        {
          containerPort = 27017,
          hostPort = 27017,
          protocol = "tcp"
        }
      ],
      environment = [
        {
            name = "MONGO_INITDB_ROOT_PASSWORD",
            value = data.aws_ssm_parameter.dev_mongodb_password.value
        },
        {
            name = "MONGO_INITDB_ROOT_USERNAME",
            value = data.aws_ssm_parameter.dev_mongodb_username.value
        }

      ],
      cpu = 256,
      memory = 512,

      logConfiguration = {
        logDriver = "awslogs",
        options = {
          "awslogs-create-group" = "true",
          "awslogs-group" = "/ecs/providerservice-mongodb-dev",
          "awslogs-region" = "eu-central-1",
          "awslogs-stream-prefix" = "ecs"
        }
      }
    }

]) : null


    tags = {
        Name = var.ecs_provider_mongodb_task_definition_tag_name
        Application = var.ecs_provider_mongodb_task_definition_app_name
        ManagedBy = "terraform"
    }
}