resource "aws_route53_zone" "public" {
  name = "${var.domain_name}"
}

resource "aws_service_discovery_private_dns_namespace" "private" {
    name = var.private_domain_name
    vpc  = module.vpc.vpc_id
}