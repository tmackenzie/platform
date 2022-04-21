resource "aws_api_gateway_domain_name" "api" {
  certificate_arn = aws_acm_certificate_validation.public_wildcard.certificate_arn
  domain_name     = "api.${local.domain_name}"
}

resource "aws_route53_record" "api" {
  name    = aws_api_gateway_domain_name.api.domain_name
  type    = "A"
  zone_id = aws_route53_zone.public.id

  alias {
    evaluate_target_health = true
    name                   = aws_api_gateway_domain_name.api.cloudfront_domain_name
    zone_id                = aws_api_gateway_domain_name.api.cloudfront_zone_id
  }
}