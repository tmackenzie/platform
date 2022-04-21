resource "aws_route53_zone" "public" {
  name = local.domain_name
}

resource "aws_route53_record" "public_ns" {
    zone_id = aws_route53_zone.public.zone_id
    name    = aws_route53_zone.public.name
    type    = "NS"
    ttl     = "30"

    records = [
        "${aws_route53_zone.public.name_servers[0]}",
        "${aws_route53_zone.public.name_servers[1]}",
        "${aws_route53_zone.public.name_servers[2]}",
        "${aws_route53_zone.public.name_servers[3]}",
    ]
}

resource "aws_service_discovery_private_dns_namespace" "private" {
    name = local.private_domain_name
    vpc  = module.vpc.vpc_id
    
}

locals {
    zone_name           = "maclayzie.com"
    domain_name         = "maclayzie.com"
    private_domain_name = "internal.${local.domain_name}"
}