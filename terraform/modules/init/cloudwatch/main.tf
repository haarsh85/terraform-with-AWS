resource "aws_cloudwatch_log_group" "cloudwatch_log_group" {
    name = var.cloudwatch_log_group_name

    tags = {
        Name = var.cloudwatch_log_group_name
        Application = var.cloudwatch_log_group_app
        ManagedBy = "terraform"
    }
  
}