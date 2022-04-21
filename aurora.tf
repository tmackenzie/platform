module "aurora_postgresql" {
  source  = "terraform-aws-modules/rds-aurora/aws"

  name              = "aurora-postgresql"
  engine            = "aurora-postgresql"
  engine_mode       = "serverless"
  storage_encrypted = true

  vpc_id                = module.vpc.vpc_id
  subnets               = module.vpc.database_subnets
  create_security_group = true
  allowed_cidr_blocks   = module.vpc.private_subnets_cidr_blocks

  monitoring_interval = 60

  apply_immediately   = true
  skip_final_snapshot = true

  db_parameter_group_name         = aws_db_parameter_group.aurora_pg.id
  db_cluster_parameter_group_name = aws_rds_cluster_parameter_group.aurora_pg.id

  scaling_configuration = {
    auto_pause               = true
    min_capacity             = 2
    max_capacity             = 4
    seconds_until_auto_pause = 300
    timeout_action           = "ForceApplyCapacityChange"
  }
}

resource "aws_db_parameter_group" "aurora_pg" {
  name        = "aurora-db-postgres-parameter-group"
  family      = "aurora-postgresql10"
  description = "aurora-db-postgres-parameter-group"
}

resource "aws_rds_cluster_parameter_group" "aurora_pg" {
  name        = "aurora-postgres-cluster-parameter-group"
  family      = "aurora-postgresql10"
  description = "aurora-postgres-cluster-parameter-group"
}