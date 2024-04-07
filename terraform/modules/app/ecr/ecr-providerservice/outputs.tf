output "ecr_repo_urls" {
  value = aws_ecr_repository.ecr_repo.repository_url
}