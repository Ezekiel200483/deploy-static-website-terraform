output "validation_record_fqdns" {
  value = [for record in aws_route53_record.cert_validation : record.fqdn]
}
output "zone_id" {
  value = aws_route53_zone.main_route.zone_id
}

output "name_servers" {
  value = aws_route53_zone.main_route.name_servers
}