resource "aws_security_group" "platform_sg" {
  name = "platform-sg"
  vpc_id = module.vpc.vpc_id
}