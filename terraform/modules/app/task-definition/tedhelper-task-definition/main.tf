data "aws_iam_role" "ecs_task_execution_role" {
    name = "ECSTaskExecutionRole"
}

data "aws_iam_role" "ecs_rds_task_role" {
    name = "ECSTaskRoleForRDS"
}

data "aws_ssm_parameter" "dev_postgres_db_username" {
    name = "/tedhelper/dev_postgres_db_username"
}

data "aws_ssm_parameter" "dev_postgres_db_password" {
    name = "/tedhelper/dev_postgres_db_password"
}

data "aws_ssm_parameter" "dev_postgres_db_connection_string" {
    name = "/tedhelper/dev_postgres_db_connection_string"
}


resource "aws_ecs_task_definition" "tedhelper_ecs_task_definition" {
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
      name = "tedHelperService",
      image = "656123244690.dkr.ecr.eu-central-1.amazonaws.com/tedhelperservice-dev-repo:latest",
      essential = true,
      portMappings = [
        {
          containerPort = 8050,
          hostPort = 8050,
          protocol = "tcp"
        }
      ],
      environment = [
        {
            name = "ted.url",
            value = "https://s8fr7sfpyi.execute-api.eu-central-1.amazonaws.com"
        },
        {
            name = "spring.datasource.username",
            value = data.aws_ssm_parameter.dev_postgres_db_username.value
        },
        {
             name = "providerservice.url",
             value = "https://s8fr7sfpyi.execute-api.eu-central-1.amazonaws.com"
        },
        {
             name = "spring.datasource.url",
             value = data.aws_ssm_parameter.dev_postgres_db_connection_string.value
        },
        {
             name = "spring.datasource.password",
             value = data.aws_ssm_parameter.dev_postgres_db_password.value
        }
      ],
      
      logConfiguration = {
        logDriver = "awslogs",
        options = {
          "awslogs-create-group" = "true",
          "awslogs-group" = "/ecs/tedhelperservice-dev",
          "awslogs-region" = "eu-central-1",
          "awslogs-stream-prefix" = "ecs"
        }
      }
    }

]) : null


    tags = {
        Name = var.ecs_tedhelper_task_definition_tag_name
        Application = var.ecs_tedhelper_task_definition_app_name
        ManagedBy = "terraform"
    }
}