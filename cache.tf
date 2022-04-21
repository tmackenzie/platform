resource "aws_elasticache_subnet_group" "cache_sn" {
  name       = "cache-subnet"
  subnet_ids = module.vpc.elasticache_subnets
}

resource "aws_elasticache_cluster" "cache" {
  cluster_id           = "cache"
  engine               = "memcached"
  node_type            = "cache.t2.micro"
  num_cache_nodes      = 2
  parameter_group_name = "default.memcached1.6"
  port                 = 11211

  subnet_group_name = aws_elasticache_subnet_group.cache_sn.name
}