resource "aws_lb" "gg-alb" {
  name               = "gg-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = ["sg-04f4eb9b5c24767c7"]
  subnets            = ["subnet-0e8bfbfe27c4d69f3", "subnet-05e51bdcfa24d9f7f"] 
  
}


resource "aws_lb_target_group" "gg-target-group" {
  name     = "gg-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = "vpc-0b39de2109d507d42"
 
}

resource "aws_lb_listener" "gg-lb-listener" {
  load_balancer_arn = aws_lb.gg-alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.gg-target-group.arn
  }
}


