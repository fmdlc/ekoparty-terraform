provider "kubernetes" {
  host                   = data.aws_eks_cluster.cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
  token                  = data.aws_eks_cluster_auth.cluster.token
  load_config_file       = false
}

module "eks-cluster" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = "ekoparty"
  cluster_version = "1.20"
  subnets         = [for subnet in module.vpc.public_subnets : subnet]
  vpc_id          = module.vpc.vpc_id

  worker_groups = [
    {
      instance_type = "t2.small"
      asg_max_size  = 3
    }
  ]
  tags = local.common_tags
}
