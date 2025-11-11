# --------------------------
# VPC
# --------------------------
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.0.0"

  name = "${var.cluster_name}-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["${var.region}a", "${var.region}b"]
  public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]

  enable_nat_gateway = false  # No NAT, cheaper
}

# --------------------------
# EKS Cluster
# --------------------------
module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.8.1"

  cluster_name    = var.cluster_name
  cluster_version = "1.29"
  subnet_ids      = module.vpc.public_subnets
  vpc_id          = module.vpc.vpc_id

  eks_managed_node_groups = {
    default = {
      node_group_name = "default"
      instance_types  = [var.node_type]
      desired_size    = var.node_count
      min_size        = 1
      max_size        = 1
    }
  }

  tags = {
    Environment = "Lab"
    Owner       = "Student"
  }
}
