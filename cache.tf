resource "aws_elasticache_security_group" "cache_sg" {
  name                 = "cache-sg"
  security_group_names = [aws_security_group.platform_sg.name]
}


resource "aws_elasticache_cluster" "cache" {
  cluster_id           = "cache"
  engine               = "memcached"
  node_type            = "cache.t1.micro"
  num_cache_nodes      = 2
  parameter_group_name = "default.memcached1.4"
  port                 = 11211

  security_group_ids = [aws_elasticache_security_group.cache_sg.id] 
}