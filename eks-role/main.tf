provider "aws" {
  region     = "ap-south-1"
}

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


resource "aws_eks_cluster" "eks_sandbox_cluster" {
count = "${length(var.public-subnet-cidr)}"
 name = "EKS-Sandox-Cluster"
 role_arn = aws_iam_role.eks-iam-role.arn

 vpc_config {
  subnet_ids = "${element(data.aws_subnet.public-subnets.*.id, count.index)}"
 }

 depends_on = [
  aws_iam_role.eks-iam-role,
 ]
}

