resource "aws_security_group" "alb_sg" {
    name = var.alb_sg_name
    description = "ALB Security Group"
    vpc_id = var.vpc_id

    tags = {
        Name = var.alb_sg_name
        Environment = var.environment
        ManagedBy = "terraform"
    }
}

resource "aws_security_group_rule" "alb_sg_inbound_http" {
  security_group_id = aws_security_group.alb_sg.id
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  description       = "HTTP traffic"
}

resource "aws_security_group_rule" "alb_sg_inbound_custom_tcp_5000" {
  security_group_id = aws_security_group.alb_sg.id
  type              = "ingress"
  from_port         = 5000
  to_port           = 5000
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "alb_sg_inbound_custom_tcp_3000" {
  security_group_id = aws_security_group.alb_sg.id
  type              = "ingress"
  from_port         = 3000
  to_port           = 3000
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "alb_sg_inbound_postgresql" {
  security_group_id = aws_security_group.alb_sg.id
  type              = "ingress"
  from_port         = 5432
  to_port           = 5432
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "alb_sg_inbound_custom_tcp_8050" {
  security_group_id = aws_security_group.alb_sg.id
  type              = "ingress"
  from_port         = 8050
  to_port           = 8050
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "alb_sg_inbound_custom_tcp_27017" {
  security_group_id = aws_security_group.alb_sg.id
  type              = "ingress"
  from_port         = 27017
  to_port           = 27017
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "alb_sg_outbound_all_traffic" {
  security_group_id = aws_security_group.alb_sg.id
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}