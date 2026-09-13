resource "aws_lb_target_group" "target_group" {
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.my_vpc.id
  tags = {
    Name = "saeed-TG"
  }
}

