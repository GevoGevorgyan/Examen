resource "aws_autoscaling_group" "gg_autoscaling_group" {
    name = "gg_autoscaling_group"
  launch_template {
    id      = aws_launch_template.gg_launch_template.id
    version = "$Latest"  
  }
  min_size         = 2  
  max_size         = 5  
  desired_capacity = 3  
  vpc_zone_identifier  = var.subnet_ids 

   target_group_arns = [aws_lb_target_group.gg-tg.arn]  
}


resource "aws_lb_target_group" "gg-tg" {
  name        = "my-target-group"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  

  health_check {
    path                = "/"
    protocol            = "HTTP"
    port                = "traffic-port"
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    interval            = 30
  }
}

resource "aws_lb" "gg_alb" {
  name               = "my-application-lb"
  internal           = false  
  load_balancer_type = "application"

  security_groups    = [aws_security_group.sg_allow_http.id, aws_security_group.sg_allow_ssh.id]  
  subnets            = var.subnet_ids

  enable_deletion_protection = false  
  

  tags = {
    Name = "my-application-lb"
  }
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.gg_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.gg-tg.arn
  }
}

