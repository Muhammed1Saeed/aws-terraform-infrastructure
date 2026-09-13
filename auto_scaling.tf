resource "aws_autoscaling_group" "auto-scaling" {
  desired_capacity   = 2
  max_size           = 3
  min_size           = 1
  vpc_zone_identifier = [
    aws_subnet.pvt-sub-1.id,
    aws_subnet.pvt-sub-2.id
  ]
  target_group_arns = [
  aws_lb_target_group.target_group.arn
]

  launch_template {
    id      = aws_launch_template.web.id
    version = "$Latest"
  }
  
}