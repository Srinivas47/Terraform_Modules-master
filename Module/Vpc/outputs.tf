# output for the environment 

output "region" {
    value = var.region
}
output "Project" {
    value = var.Project-name
}
output "environment" {
    value = var.environment
}

#variables for the vpc


output "vpc" {
    value = var.roboshop_vpc.id
}
output "vpc_cidr_block" {
    value = var.vpc_cidr
}

# outputs for the igw 
output "igw" {
    value = var.aws_internet_gateway
}

# output for the public subnet
output "public_subnet" {
    value = var.public_subnet.id
}
output "availability_zone" {
    value = var.availability_zone
}
output "cidr" {
    value =var.public_subnet_cidr.id
}
# output for the private subnet
output "private_subnet" {
    value = var.private_subnet.id
}
output "availability_zone" {
    value = var.availability_zone
}
output "cidr" {
    value =var.private_subnet.id
}