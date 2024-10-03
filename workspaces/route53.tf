resource "aws_route53_record" "expense" {
  for_each = lookup(var.servers, terraform.workspace)

  zone_id         = local.zone_id
  type            = "A"
  ttl             = 300
  allow_overwrite = true

  name            = each.key == "frontend-prod" ? local.domain_name : "${each.key}.${local.domain_name}"
  
  records         = startswith(each.key, "frontend") ? [aws_instance.expense[each.key].public_ip] : [aws_instance.expense[each.key].private_ip]
}