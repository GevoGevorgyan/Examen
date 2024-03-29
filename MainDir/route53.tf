data "aws_lb" "gg_lb" {
  arn=aws_lb.gg_alb.arn
}

resource "aws_route53_record" "cname_record" {
  zone_id = var.route53_zone_id  
  name    = "ggalb" 
  type    = "CNAME"
  ttl     = 30

  records = [
    data.aws_lb.gg_lb.dns_name
  ]
}