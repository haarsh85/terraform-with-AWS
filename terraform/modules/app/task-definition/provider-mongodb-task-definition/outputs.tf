output "ecs_provider_mongodb_task_def_family" {
  value = aws_ecs_task_definition.provider_mongodb_ecs_task_definition.family
}