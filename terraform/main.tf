provider "aws" {
  region = "us-east-1" # or your desired region
}

# Create the EKS Cluster
module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = "my-cluster"
  cluster_version = "1.21"
  subnets         = ["subnet-xxxxxxxx", "subnet-xxxxxxxx"]
  vpc_id          = "vpc-xxxxxxxx"

  node_groups = {
    eks_nodes = {
      desired_capacity = 2
      max_capacity     = 3
      min_capacity     = 1

      instance_type = "t3.medium"
    }
  }

  tags = {
    Environment = "dev"
    Terraform   = "true"
  }
}

# Output the cluster config
output "kubeconfig" {
  value = module.eks.kubeconfig
  sensitive = true
}

output "cluster_id" {
  value = module.eks.cluster_id
}

output "cluster_endpoint" {
  value = module.eks.cluster_endpoint
}
