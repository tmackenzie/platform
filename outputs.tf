output "vpc_id" {
    description = "The ID of the VPC"
    value       = module.vpc.vpc_id
}

output "public_subnets" {
    description = "public subnets for the VPC"
    value       = module.vpc.public_subnets
}

output "public_subnets_cidr_blocks" {
    description = "public subnet cidr blocks for the VPC"
    value       = module.vpc.public_subnets_cidr_blocks
}

output "private_subnets" {
    description = "private subnets for the VPC"
    value       = module.vpc.private_subnets
}

output "private_subnets_cidr_blocks" {
    description = "private subnet cidr blocks for the VPC"
    value       = module.vpc.private_subnets_cidr_blocks
}

output "public_zone" {
    description = "AWS Route 53 Zone of the public domain"
    value       = aws_route53_zone.public
}