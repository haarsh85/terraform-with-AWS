resource "aws_ecs_service" "ecs_service" {
    name = var.ecs_service_name
    cluster = var.ecs_cluster_name
    launch_type = "FARGATE"
    platform_version = "1.4.0"
    task_definition = var.ecs_task_def_family
    desired_count = 1
    lifecycle {
      ignore_changes = [ desired_count ]
    }
    network_configuration {
      subnets = var.subnets_for_ecs_service
      security_groups = [var.sg_id_for_ecs_service]
      assign_public_ip = true
    }

    load_balancer {
      target_group_arn = var.lb_for_ecs_service
      container_name = var.container_name
      container_port = var.container_port
    }

    tags = {
        Name = var.ecs_service_name
        Application = var.ecs_service_app
        ManagedBy = "terraform"
    }
}