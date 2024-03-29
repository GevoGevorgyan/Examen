resource "aws_launch_template" "gg_launch_template" {
  name_prefix             = "gg-launch-template"
  description             = "My launch template for EC2 instance"
  instance_type           = "t2.micro"  
  key_name                = var.key_pair_name  
  vpc_security_group_ids  = [aws_security_group.sg_allow_http.id, aws_security_group.sg_allow_ssh.id]  
  image_id                = var.image_id  
  user_data = base64encode(file("./user_data_script.sh"))
}

