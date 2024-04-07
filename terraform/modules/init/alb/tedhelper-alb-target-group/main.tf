resource "aws_lb_target_group" "tedhelper_alb_target_group" {
  name        = var.target_group_name
  port        = var.port_for_lb_target_group
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = var.vpc_for_lb_target_group

  health_check {
    enabled = true
    healthy_threshold = 2
    interval = 300
    protocol = "HTTP"
    path = var.health_check_path
    port = "traffic-port"
    unhealthy_threshold = 2
  }

    tags = {
      Name = var.lb_target_group_name
      Application = var.lb_target_group_app
      ManagedBy = "terraform"
  }
}

resource "aws_lb_listener" "alb_listner_tedhelper" {
  load_balancer_arn = var.alb_arn
  port              = "8050"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tedhelper_alb_target_group.arn
  }

    tags = {
      Name = var.lb_listener_name
      Application = var.lb_listener_app
      ManagedBy = "terraform"
  }
}