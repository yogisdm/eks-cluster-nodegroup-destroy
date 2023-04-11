output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc_creation
}

output "subnets" {
  description = "Subnets created with CIDR blocks"
  value = module.subnet_creation

}

output "internet_gateway" {
  description = "internet gateway arn"
  value = module.internet_gateway.internet-gateway-yogi-devops
}

output "route_creation" {
description = "route creation output"
value = module.route_creation
}

output "iam_instance_profile" {
description = "instance profile output "

value = module.iam_instance_profile
}