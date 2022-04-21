# TODO: figure out how to use subnets b/c
# Error: Error creating CacheSecurityGroup: InvalidParameterValue: Use of cache security groups is not 
# permitted in this API version for your account.
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_subnet_group



resource "aws_elasticache_cluster" "cache" {
  cluster_id           = "cache"
  engine               = "memcached"
  node_type            = "cache.t1.micro"
  num_cache_nodes      = 2
  parameter_group_name = "default.memcached1.4"
  port                 = 11211

  security_group_ids = [aws_elasticache_security_group.cache_sg.id] 
}