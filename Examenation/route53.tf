resource "aws_route53_record" "gg-record" {
  zone_id = "Z10299161M47DBD68JOWT"
  name    = "gg.com"
  type    = "CNAME"
  ttl     = "300"
  records = [aws_lb.gg-alb.dns_name]
}
