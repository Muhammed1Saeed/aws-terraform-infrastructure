resource "aws_lb" "app_lb" {
  name               = "app-alb"
  internal           = false
  load_balancer_type = "application"

  security_groups = [
    aws_security_group.allow_https.id
  ]

  subnets = [
    aws_subnet.pub-sub-1.id,
    aws_subnet.pub-sub-2.id
  ]
  tags = {
    Name = "saeed_LB"
  }
}
resource "aws_lb_listener" "https_listener" {
  load_balancer_arn = aws_lb.app_lb.arn

  port     = 80
  protocol = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target_group.id
  }
}


output "alb_dns_name" {
  value = aws_lb.app_lb.dns_name
}