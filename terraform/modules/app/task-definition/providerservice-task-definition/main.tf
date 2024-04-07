data "aws_iam_role" "ecs_task_execution_role" {
    name = "ECSTaskExecutionRole"
}

data "aws_iam_role" "ecs_rds_task_role" {
    name = "ECSTaskRoleForRDS"
}

data "aws_ssm_parameter" "dev_provider_db_url" {
    name = "/provider/dev_db_url"
}

data "aws_ssm_parameter" "dev_provider_secret" {
    name = "/provider/dev_secret"
}


resource "aws_ecs_task_definition" "provider_ecs_task_definition" {
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
      name = "providerservice",
      image = "656123244690.dkr.ecr.eu-central-1.amazonaws.com/providerservice-dev-repo:latest",
      essential = true,
      portMappings = [
        {
          containerPort = 5000,
          hostPort = 5000,
          protocol = "tcp"
        }
      ],
      environment = [
        {
            name = "PORT",
            value = "5000"
        },
        {
            name = "DB_URL",
            value = data.aws_ssm_parameter.dev_provider_db_url.value
        },
        {
            name = "SECRET",
            value = data.aws_ssm_parameter.dev_provider_secret.value
        }

      ],
      cpu = 256,
      memory = 512,

      logConfiguration = {
        logDriver = "awslogs",
        options = {
          "awslogs-create-group" = "true",
          "awslogs-group" = "/ecs/providerservice-dev",
          "awslogs-region" = "eu-central-1",
          "awslogs-stream-prefix" = "ecs"
        }
      }
    }

]) : null


    tags = {
        Name = var.ecs_provider_task_definition_tag_name
        Application = var.ecs_provider_task_definition_app_name
        ManagedBy = "terraform"
    }
}