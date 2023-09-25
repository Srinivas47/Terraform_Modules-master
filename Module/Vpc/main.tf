
# Create a VPC
resource "aws_vpc" "roboshop_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {

    Name = "${var.project_name}-${var.environment}-vpc"
  }
}

# Create an Internet Gateway (IGW)
resource "aws_internet_gateway" "roboshop_igw" {
  vpc_id = aws_vpc.roboshop_vpc.id

  tags {
    Name = "${var.project_name}-${var.environment}-internet_gateway"
    }
}

# Create a public subnet
resource "aws_subnet" "public_subnet" {
  vpc_id                  = var.roboshop_vpc.id 
  cidr_block              = var.private_subnet_cidr.id  #  public subnet CIDR block
  availability_zone       = var.availability_zone.id #  desired availability zone
  map_public_ip_on_launch = true # Enable auto-assign public IP addresses
  
  tags   = {
    Name = "${var.project_name}-${var.environment}-public subnet"}
}

# Create a private subnet
resource "aws_subnet" "private_subnet" {
  vpc_id            = var.roboshop_vpc.id
  cidr_block        = var.private_subnet_cidr.id #  private subnet CIDR block
  availability_zone = var.availability_zone.id #  availability zone
  
  tags = {
    Name = "${var.project_name}-${var.environment}-private subnet"}
  
}


# Create a default route table for the public subnet
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.roboshop_vpc.id

  tags = {
    Name = "${var.Project.name}-${var.environment}-public_route_table"
  }
}

# Create a route to the IGW in the public route table
resource "aws_route" "public_route" {
  route_table_id         = aws_route_table.public_route_table.id
  destination_cidr_block = var.destination_cidr_block.id
  gateway_id             = aws_internet_gateway.roboshop_igw.id
}

# Associate the public subnet with the public route table
resource "aws_route_table_association" "public_subnet_association" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_route_table.id
}



