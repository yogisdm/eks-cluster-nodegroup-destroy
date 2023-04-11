provider "aws" {
  region     = "ap-south-1"
}


terraform {
  backend "s3" {
    bucket = "yogi-tf"
    key    = "terraform-backend/eks-nodegroup.tf"
    region = "ap-south-1"
  }
}

module "eks_cluster_creation" {
  source = "./eks-cluster-creation"
}

module "nodegroup_creation" {
source = "./node-group-creation"
depends_on = ["module.eks_cluster_creation"]
}

