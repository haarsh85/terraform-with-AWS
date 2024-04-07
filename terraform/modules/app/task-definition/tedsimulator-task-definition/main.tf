data "aws_iam_role" "ecs_task_execution_role" {
    name = "ECSTaskExecutionRole"
}

data "aws_iam_role" "ecs_rds_task_role" {
    name = "ECSTaskRoleForRDS"
}

resource "aws_ecs_task_definition" "tedsim_ecs_task_definition" {
    family                   = var.ecs_task_definition_family
    container_definitions    = file(var.container_definition_file_path)
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

    tags = {
        Name = var.ecs_tedsim_task_definition_tag_name
        Application = var.ecs_tedsim_task_definition_app_name
        ManagedBy = "terraform"
    }
}