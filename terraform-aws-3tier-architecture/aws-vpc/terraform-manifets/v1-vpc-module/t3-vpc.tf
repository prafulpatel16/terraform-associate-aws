# Create VPC Terraform module

module "vpc" {
    source  = "terraform-aws-modules/vpc/aws"
    version = "3.11.3"
    # insert the 23 required variables here

    # VPC Basic details
    name = "prafuls-portfolio-vpc"
    cidr = "10.0.0.0/16" # 10.0.0.0/8 is reserved for EC2-Classic

    azs                 = ["us-east-1a", "us-east-1b"]
    private_subnets     = ["10.0.1.0/24", "10.0.2.0/24"]
    public_subnets      = ["10.0.101.0/24", "10.0.102.0/24"]

    # Database subnetscd ..
    
    database_subnet_group_name = true
    create_database_subnet_route_table = true
    database_subnets    = ["10.0.151.0/24", "10.0.152.0/24"]

    create_database_internet_gateway_route  = false
    create_database_nat_gateway_route  = false

    # NAT Gateway = Outbound internet connection from database
    enable_nat_gateway = true
    single_nat_gateway = true


    # VPC DNS Parameters
    enable_dns_hostnames = true
    enable_dns_support = true

        
    public_subnet_tags = {
        Name = "public-subnets"
    }

    private_subnet_tags = {
        Name = "private-subnets"
    }

    database_subnet_tags = {
        Name = "database-subnets"
    }

    
    tags = {
        Owner = "Praful Patel"
        Environment = "dev"
    }

    vpc_tags= {
        Name = "vpc-dev"
    }
}