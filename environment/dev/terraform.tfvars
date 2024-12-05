aws_region  = "us-east-1"
environment = "dev"
project     = "fonka"
private-subnet-ids= ["id-565sa64576s4as","id-565sa64576s4as"]

eks = {
  cluster_name       = "eks-cluster"
  kubernetes_version = "1.31"
}

eks_managed_node_groups = {
  node-group = {
    cluster_name            = "eks-cluster"
    node_group_name         = "node-group"
    node_group_desired_size = 3
    node_group_min_size     = 1
    node_group_max_size     = 5
  }
}
