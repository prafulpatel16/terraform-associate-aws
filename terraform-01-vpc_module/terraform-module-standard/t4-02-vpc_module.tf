#Crete VPC Terraform module

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "2.78.0"
  # version = "~> 2.78"

  # VPC Basic details

  #name = "vpc-dev"
  name = "${local.name}-${var.vpc_name}" # Using a local variable and vpc variable
  cidr = var.vpc_cidr_block # 10.0.0.0/8 is reserved for EC2-Classic

  azs             = var.vpc_availability_zones
  private_subnets = var.vpc_private_subnets
  public_subnets  = var.vpc_public_subnets


  #Database subnets
  create_database_subnet_group       = var.vpc_create_database_subnet_group
  create_database_subnet_route_table = var.vpc_create_database_subnet_route_table
  database_subnets                   = var.vpc_database_subnets

  #create_database_nat_gateway_route = true
  #create_database_internet_gateway_route = false

  #NAT Gateway - Outbound Internet connection
  enable_nat_gateway = var.vpc_enable_nat_gateway
  single_nat_gateway = var.vpc_single_nat_gateway

  #VPC DNS parameters

  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = local.common_tags
    vpc_tags = local.common_tags


  public_subnet_tags = {
    Type = "Public-Subnet-Web"
  }

  private_subnet_tags = {
    Type = "Private-Subnet-App"
  }

  database_subnet_tags = {
    Type = "Database-Subnet-DB"
  }

}