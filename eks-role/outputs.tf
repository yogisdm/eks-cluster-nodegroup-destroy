output "eks_role" {
  description = "The ID of the VPC"
  value       = module.aws_iam_role.eks-iam-role.name
}

output "workernodes_role" {
  description = "The ID of the VPC"
  value       = module.aws_iam_role.workernodes.name
}

