resource "aws_route53_record" "expense" {
  for_each = var.servers

  zone_id         = local.zone_id
  type            = "A"
  ttl             = 300
  allow_overwrite = true

  name            = each.key == "frontend" && var.environment == "prod" ? local.domain_name : "${each.key}-${var.environment}.${local.domain_name}"
  
  records         = each.key == "frontend" ? [aws_instance.expense[each.key].public_ip] : [aws_instance.expense[each.key].private_ip]
}
