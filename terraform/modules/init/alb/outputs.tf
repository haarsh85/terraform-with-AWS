output "alb_arn" {
    value = aws_lb.aws_alb.id
  
}

output "alb_dns_name" {
    value = aws_lb.aws_alb.dns_name
  
}