#Crete VPC Terraform module

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "2.78.0"
  # version = "~> 2.78"

  # VPC Basic details

  name = "vpc-dev"
  cidr = "10.0.0.0/16" # 10.0.0.0/8 is reserved for EC2-Classic

  azs             = ["us-east-1a", "us-east-1b"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]


  #Database subnets
  create_database_subnet_group       = true
  create_database_subnet_route_table = true
  database_subnets                   = ["10.0.150.0/24", "10.0.152.0/24"]

  #create_database_nat_gateway_route = true
  #create_database_internet_gateway_route = false

  #NAT Gateway - Outbound Internet connection
  enable_nat_gateway = true
  single_nat_gateway = true

  #VPC DNS parameters

  enable_dns_hostnames = true
  enable_dns_support   = true

  public_subnet_tags = {
    Type = "Public-Subnet-Web"
  }

  private_subnet_tags = {
    Type = "Private-Subnet-App"
  }

  database_subnet_tags = {
    Type = "Database-Subnet-DB"
  }

  tags = {
    Owner       = "Praful"
    Environment = "Dev"
  }

  vpc_tags = {
    Name = "vpc-dev"
  }

}