resource "aws_ecr_repository" "ecr_repo" {
    for_each = toset(var.ecr_repo_names)
    name = each.value
    image_tag_mutability = "MUTABLE"

    tags = {
        Name = "${each.value}"
        Environment = var.environment
        ManagedBy = "terraform"
    }
}