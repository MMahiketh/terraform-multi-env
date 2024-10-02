locals {
  project = "expense"

  common_tags = {
    Project     = local.project
    Environment = terraform.workspace
    Terraform   = "true"
  }

  zone_id     = "Z02855522FE67JKRUDSDP"
  domain_name = "mahdo.site"
}