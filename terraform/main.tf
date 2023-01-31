provider "aws" {
  region = var.aws_region
}

module "k8s_cluster" {
  source = "terraform-aws-modules/eks/aws"

  cluster_name = "my-cluster"
  subnets = var.subnets
  vpc_id = var.vpc_id
  tags = var.tags
}

locals {
  cluster_endpoint = module.k8s_cluster.cluster_endpoint
  cluster_certificate_authority_data = module.
