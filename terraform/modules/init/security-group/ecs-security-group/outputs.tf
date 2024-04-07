output "sg_id_for_ecs_service" {
  value = aws_security_group.ecs_service_sg.id
}