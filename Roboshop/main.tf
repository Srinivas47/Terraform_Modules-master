# Define the AWS provider configuration
provider "aws" {
  region = "us-east-1" # Change to your desired AWS region
}

# create the vpc

module "vpc" {
    source = "../Module/Vpc"
    
    region                  = var.region
    Project-name            = var.Project-name
    aws_internet_gateway    = var.aws_internet_gateway
    public_subnet           = var.public_subnet
    public_subnet_cidr      = var.public_subnet_cidr
    availability_zone       = var.availability_zone
    private_subnetn         = var.private_subnetn
    private_subnet_cidr     = var. private_subnet_cidr
    public_route_table      = var. public_route_table
    destination_cidr_block  = var.destination_cidr_block
    private_route_table     = var.private_route_table
}

