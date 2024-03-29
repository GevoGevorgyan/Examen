resource "aws_launch_configuration" "gg_launch_template" {
  name          = "gg_launch_template"
  image_id      = "ami-019f9b3318b7155c5"
  instance_type = "t2.micro"
  
}

resource "aws_autoscaling_group" "gg-autoscaling-group" {
  launch_configuration = aws_launch_configuration.gg_launch_template.id
  vpc_zone_identifier  = ["subnet-0e8bfbfe27c4d69f3", "subnet-05e51bdcfa24d9f7f"] 
  min_size             = 1
  max_size             = 3
  desired_capacity     = 2
  
}
