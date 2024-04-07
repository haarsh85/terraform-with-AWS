resource "aws_security_group" "postgres_db_sg" {
    name = var.postgres_db_sg_name
    description = "Postgres DB Security Group"
    vpc_id = var.vpc_id

    tags = {
        Name = var.postgres_db_sg_name
        Environment = var.environment
        ManagedBy = "terraform"
    }
}

resource "aws_security_group_rule" "postgres_db_sg_inbound_custom_tcp_27017" {
  security_group_id = aws_security_group.postgres_db_sg.id
  type              = "ingress"
  from_port         = 5432
  to_port           = 5432
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "postgres_db_sg_outbound_all_traffic" {
  security_group_id = aws_security_group.postgres_db_sg.id
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}