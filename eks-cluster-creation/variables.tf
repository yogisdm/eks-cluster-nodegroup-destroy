variable "public-subnet-cidr" {
 description = "Update the CIDR block ranges for public subnets"
 default = ["10.0.4.0/24","10.0.5.0/24","10.0.6.0/24"]
 type = list
}

variable "eks-cluster-name" {
 description = "EKS Cluster Name"
 default = "sandbox-eks-cluster1"
}

