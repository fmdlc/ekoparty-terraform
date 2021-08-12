locals {
  common_tags = {
    Name                                 = "demo-cluster"
    Environment                          = var.environment
    "kubernetes.io/cluster/demo-cluster" = "shared"
    "kubernetes.io/role/elb"             = "1"
  }
}