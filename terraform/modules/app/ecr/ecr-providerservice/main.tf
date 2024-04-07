resource "aws_ecr_repository" "ecr_repo" {
    name = var.ecr_repo_name
    image_tag_mutability = "MUTABLE"

    tags = {
        Name = var.ecr_repo_name
        Environment = var.environment
        ManagedBy = "terraform"
    }
}