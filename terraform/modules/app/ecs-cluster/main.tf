resource "aws_ecs_cluster" "ecs_cluster" {
    name = var.ecs_cluster_name

    tags = {
        Name = var.ecs_cluster_tag_name
        Application = var.ecs_cluster_app_name
        ManagedBy = "terraform"
    } 
}