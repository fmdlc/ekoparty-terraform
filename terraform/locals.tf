locals {
  common_tags = {
    Name                             = "ekoparty"
    Environment                      = var.environment
    "kubernetes.io/cluster/ekoparty" = "shared"
    "kubernetes.io/role/elb"         = "1"
  }
}