output "route53_dns" {
  value = aws_route53_record.cname_record.records
}