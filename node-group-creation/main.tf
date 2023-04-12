data "aws_vpc" "yogi-vpc"{

filter {
 name = "tag:Name"
 values = ["Yogi-VPC-DevOps"]
}
}


data "aws_subnet_ids" "public-subnets" {
  vpc_id = data.aws_vpc.yogi-vpc.id

  filter {
    name   = "tag:Name"
    values = ["public-subnet-*"] 
  }
}

data "aws_iam_role" "example" {
  name = "eks-node-group-example"
}

data "aws_eks_cluster" "eks_creation" {
  name = var.eks-cluster-name1
  
}

resource "aws_eks_node_group" "worker-node-group" {
  cluster_name  = data.aws_eks_cluster.eks_creation.id
  node_group_name = "sandbox-workernodes"
  node_role_arn  = data.aws_iam_role.example.arn
  subnet_ids = "${element(data.aws_subnet_ids.public-subnets.*.id, count.index)}"
  instance_types = ["t2.medium"]
 
  scaling_config {
   desired_size = 1
   max_size   = 1
   min_size   = 1
  }
 
//  depends_on = [
  // aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy,
   //aws_iam_role_policy_attachment.AmazonEKS_CNI_Policy
  //]
 }

  
 