

module "eks_cluster" {
  source             = "./modules/eks-cluster"
  cluster_name       = var.eks.cluster_name
  subnet_ids         = module.vpc.private_subnets
  vpc_id             = module.vpc.vpc_id
  environment        = var.environment
  kubernetes_version = var.eks.kubernetes_version
  tags = {
    Terraform   = "true"
    Environment = var.environment
    Project     = var.project
  }
  depends_on = [module.vpc]
}

module "eks_node_groups" {
  source          = "./modules/eks-managed-node-group"
  for_each        = var.eks_managed_node_groups
  cluster_name    = each.value.cluster_name
  node_group_name = each.value.node_group_name
  subnet_ids      = var.private-subnet-ids
  environment     = var.environment
  desired_size    = each.value.node_group_desired_size
  min_size        = each.value.node_group_min_size
  max_size        = each.value.node_group_max_size
  tags = {
    Terraform   = "true"
    Environment = var.environment
    Project     = var.project
  }
  depends_on = [module.eks_cluster]
}
