output "ecs_provider_task_def_family" {
  value = aws_ecs_task_definition.provider_ecs_task_definition.family
}