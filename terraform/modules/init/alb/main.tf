resource "aws_lb" "aws_alb" {
    name = var.alb_name
    internal = false
    load_balancer_type = "application"
    ip_address_type = "ipv4"

    security_groups = [ var.alb_sg ]
    subnets = var.subnets_for_alb

    # access_logs {
    #   bucket = var.alb_dev_access_log_s3_bucket
    #   enabled = true
    # }

    # connection_logs {
    #   bucket = var.alb_dev_connection_log_s3_bucket
    #   enabled = true
    # }

    tags = {
      Name = var.alb_name
      Environment = var.environment
      ManagedBy = "terraform"
  }
}